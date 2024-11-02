return {
  'kaarmu/typst.vim',
  ft = 'typst',
  config = function()
    require('lspconfig').tinymist.setup {
      -- To fix error: https://github.com/neovim/neovim/issues/30675
      offset_encoding = "utf-8",
      single_file_support = true,
      root_dir = function ()
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
  end,
}
