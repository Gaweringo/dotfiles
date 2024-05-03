return {
  'luckasRanarison/nvim-devdocs',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = { 'DevdocsOpen', 'DevdocsOpenCurrent' },
  opts = {
    wrap = true,
    previewer_cmd = 'glow',
    cmd_args = { '-s', 'auto', '-w', '97' },
    cmd_ignore = {},
    picker_cmd = true,
    picker_cmd_args = { '-s', 'auto', '-w', '45' },
    mappings = {
      open_in_browser = '<leader>vb',
      toggle_rendering = '<leader>vr',
    },
  },
}
