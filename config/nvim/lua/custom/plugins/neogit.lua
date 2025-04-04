return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- Diff integration
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>go', '<cmd>Neogit<cr>', desc = 'Neo[g]it [o]pen' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neo[g]it [c]ommit' },
    { '<leader>gp', '<cmd>Neogit pull<cr>', desc = 'Neo[g]it [p]ull' },
    { '<leader>gP', '<cmd>Neogit push<cr>', desc = 'Neo[g]it [p]ush' },
    { '<leader>gb', '<cmd>Neogit branch<cr>', desc = 'Neo[g]it [b]ranch' },
    { '<leader>gl', '<cmd>NeogitLogCurrent<cr>', desc = '[g]it [l]og current file' },
    { '<leader>gL', function() require('neogit').action('log', 'log_current', {'--graph', '--decorate'})() end, desc = '[g]it [L]og' },
  },
  opts = { graph_style = 'unicode' },
  config = true,
}
