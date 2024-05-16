return {
  'Kohirus/cppassist.nvim',
  opt = true,
  ft = { 'h', 'cpp', 'hpp', 'c', 'cc', 'cxx' },
  config = function()
    require('cppassist').setup()
  end,
  keys = {
    -- generate the function definition or static variable definition in source
    { '<leader>cf', '<Cmd>ImplementInSource<CR>', desc = 'Implement in Source' },
    -- generate the function definition or static variable definition in source in visual mode
    { '<leader>cf', '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>', desc = 'Implement in Source in Visual Mode', mode = 'v' },
    -- generate the function definition or static variable definition in header
    { '<leader>cv', '<Cmd>ImplementOutOfClass<CR>', desc = 'Implement out of Class' },
  },
}
