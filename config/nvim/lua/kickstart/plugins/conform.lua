return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        vhdl = { 'hdl_emacs' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      formatters = {
        hdl_emacs = {
          command = 'emacs',
          args = {
            '$FILENAME',
            '--batch',
            '--eval',
            -- Taken from https://github.com/InES-HPMM/emacs-vhdl-formatter-vscode/blob/c811eccd75b95cff9d6fa5144e04c7a92f1de17a/src/extension.ts#L8
            '(let (vhdl-file-content next-line) (while (setq next-line (ignore-errors (read-from-minibuffer ""))) (setq vhdl-file-content (concat vhdl-file-content next-line "\\n"))) (with-temp-buffer (vhdl-mode) (setq vhdl-basic-offset 3) (insert vhdl-file-content) (vhdl-beautify-region (point-min) (point-max)) (princ (buffer-string))))',
          },
          stdin = true,
        },
      },
    },
    keys = {
      { '<leader>F', '<cmd>Format<CR>', desc = 'Format document' },
    },
  },
  vim.api.nvim_create_user_command('Format', function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ['end'] = { args.line2, end_line:len() },
      }
    end
    require('conform').format { async = true, lsp_fallback = true, range = range }
  end, { range = true }),
  vim.keymap.set('n', '<leader>F', ':Format<CR>', { desc = 'Format document' }),
}

-- vim: ts=2 sts=2 sw=2 et
