return {
  'kaarmu/typst.vim',
  ft = 'typst',
  config = function()
    require('lspconfig').tinymist.setup {
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
