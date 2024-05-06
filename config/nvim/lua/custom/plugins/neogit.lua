return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- Diff integration

    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>go', '<cmd>Neogit<cr>', desc = 'Neo[g]it [o]pen' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neo[g]it [c]ommit' },
    { '<leader>gp', '<cmd>Neogit pull<cr>', desc = 'Neo[g]it [p]ull' },
    { '<leader>gP', '<cmd>Neogit push<cr>', desc = 'Neo[g]it [p]ush' },
    { '<leader>sb', '<cmd>Telescope git_branches<cr>', desc = '[s]earch [b]ranches' },
    { '<leader>sc', '<cmd>Telescope git_commits<cr>', desc = '[s]earch [c]ommits' },
  },
  config = true,
}
