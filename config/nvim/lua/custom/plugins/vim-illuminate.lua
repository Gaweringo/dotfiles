return {
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    require('illuminate').configure {
      providers = {
        'treesitter',
        'regex',
      },
      delay = 500,
      filetypes_denylist = {},
      filetypes_allowlist = { 'vhdl', 'dosini', 'markdown' },
    }
  end,
}
