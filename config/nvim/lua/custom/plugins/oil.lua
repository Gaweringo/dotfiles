return {
  'stevearc/oil.nvim',
  opts = {
    columns = {
      { 'mtime', highlight = 'Comment' },
      { 'size', highlight = 'Type' },
      'icon',
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
