return {
  'stevearc/overseer.nvim',
  keys = {
    { '<leader>po', '<cmd>OverseerRun<cr>', desc = '[o]verseer run' },
    { '<leader>pO', '<cmd>OverseerToggle<cr>', desc = '[O]verseer toggle' },
    { '<leader>pa', '<cmd>OverseerQuickAction<cr>', desc = 'Overseer Quick [a]ction' },
  },
  opts = {
    templates = {
      'builtin',
      'user.xmake_build',
      'user.vunit',
    },
  },
  cmd = {
    'OverseerBuild',
    'OverseerRun',
    'OverseerInfo',
    'OverseerOpen',
    'OverseerQuickAction',
  },
}
