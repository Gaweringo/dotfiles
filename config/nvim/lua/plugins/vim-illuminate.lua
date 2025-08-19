return {
  -- Highlight word references
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    require('illuminate').configure {
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      under_cursor = false,
      delay = 500,
      filetypes_denylist = {},
      filetypes_allowlist = { 'vhdl', 'dosini', 'markdown' },
    }
  end,
}
