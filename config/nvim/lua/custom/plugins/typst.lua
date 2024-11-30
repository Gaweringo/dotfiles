return {
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    config = function()
      require('lspconfig').tinymist.setup {
        -- To fix error: https://github.com/neovim/neovim/issues/30675
        offset_encoding = 'utf-8',
        single_file_support = true,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          exportPdf = 'onSave', -- Choose onType, onSave or never.
          -- serverPath = "" -- Normally, there is no need to uncomment it.
        },
      }
      -- INFO: Need to disable TreeSitter highlighting for conceal to work
      -- :TSBufDisable highlight
      vim.g.typst_conceal_math = 1
      vim.g.typst_conceal_emoji = 1
      vim.g.typst_conceal = 1

      vim.api.nvim_create_user_command('TypstPin', function(args)
        if args.bang ~= true then
          vim.lsp.buf.execute_command { command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } }
        else
          vim.lsp.buf.execute_command { command = 'tinymist.pinMain', arguments = { nil } }
        end
      end, { desc = 'Pin the current buffer as the main file in tinymist', bang = true })

      vim.api.nvim_create_user_command('TypstOpen', function(args)
        local file_name = vim.api.nvim_buf_get_name(0)
        vim.ui.open(vim.fn.fnamemodify(file_name, ':p:r') .. '.pdf')
      end, { desc = 'Open the pdf of the current file' })
    end,
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    config = function()
      require('typst-preview').setup {
        get_root = function(path_of_main_file)
          return vim.fn.getcwd()
        end,
      }
    end,
    cmd = { 'TypstPreview' },
  },
}
