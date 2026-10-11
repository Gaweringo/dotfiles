return {
  -- Highlight word references
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    require('illuminate').configure {
      under_cursor = false,
      delay = 500,
      filetypes_denylist = {},
    }
  end,
}
