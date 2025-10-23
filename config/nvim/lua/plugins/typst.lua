vim.lsp.config("tinymist", {
  settings = {
    formatterMode = "typstyle",
    -- exportPdf      = "onType", -- TODO: onSave doesn't work for some reason
    -- semanticTokens = "disable", -- Maybe disable?
    lint          = { enabled = true },
  },
  -- TODO: figure out way to set root dir nicely (seems to not work when setting it here like that. LSP Doesn't start)
  -- root_dir = function()
  --   return vim.fn.getcwd()
  -- end
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.typ' },
  callback = function(ev)
    -- Enable concealing for typst buffers
    vim.b.conceallevel = 3

    vim.api.nvim_buf_create_user_command(ev.buf, 'TypstOpen', function()
      local file_name = vim.api.nvim_buf_get_name(0)
      vim.ui.open(vim.fn.fnamemodify(file_name, ':p:r') .. '.pdf')
    end, { desc = 'Open the pdf of the current file' })

    vim.keymap.set('n', '<localleader>P', '<Cmd>TypstOpen<Cr>',
      { desc = "Typst [P]DF preview (:TypstOpen)", buffer = ev.buf, silent = true })

    vim.keymap.set('n', '<localleader>w', '<Cmd>TypstWatch<Cr>',
      { desc = "Typst [w]atch", buffer = ev.buf, silent = true })
  end,
}
)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Client / Language specific
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buf = ev.buf
    if client ~= nil and client.name == 'tinymist' then
      -- typst-preview mappings
      vim.keymap.set('n', '<localleader>p', '<Cmd>TypstPreviewToggle<Cr>', {
        desc =
        "Toggle typst [p]review",
        buffer = buf,
        silent = true
      })

      vim.keymap.set('n', '<localleader>F', '<Cmd>TypstPreviewNoFollowCursor<Cr>', {
        desc =
        "Preview don't [F]ollow cursor",
        buffer = buf,
        silent = true
      })

      vim.keymap.set('n', '<localleader>f', '<Cmd>TypstPreviewFollowCursor<Cr>', {
        desc =
        "Preview [f]ollow cursor",
        buffer = buf,
        silent = true
      })

      -- tinymist mappings
      vim.keymap.set('n', '<localleader>m', '<Cmd>TypstPin<Cr>',
        { desc = "Typst [p]in main", buffer = buf, silent = true })
      vim.keymap.set('n', '<localleader>u', '<Cmd>TypstPin!<Cr>',
        { desc = "Typst [u]npin main", buffer = buf, silent = true })

      vim.api.nvim_buf_create_user_command(buf, 'TypstPin', function(args)
        if args.bang ~= true then
          client:exec_cmd({ title = 'pin', command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } },
            { bufnr = buf })
        else
          client:exec_cmd({ title = 'unpin', command = 'tinymist.pinMain', arguments = { vim.v.null } }, { bufnr = buf })
        end
      end, { desc = 'Pin the current buffer as the main file in tinymist', bang = true })
    end
  end,
})

return {
  {
    -- :make, :TypstWatch
    'kaarmu/typst.vim',
    ft = 'typst',
    config = function()
      -- Enable concealing
      vim.g.typst_conceal = 1
      -- INFO: Need to disable TreeSitter highlighting for conceal to work
      -- :TSBufDisable highlight
      -- vim.g.typst_conceal_math = 1
      vim.g.typst_conceal_emoji = 1
    end,
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {
      -- Open in chromium window without shell around it
      open_cmd = [[chromium --app=%s 2>&1]],
      -- Use tinymist from mason
      dependencies_bin = { ['tinymist'] = 'tinymist' },
      get_root = function(path_of_main_file)
        return vim.fn.getcwd()
      end,
    },
    cmd = { 'TypstPreview' },
  },
}
