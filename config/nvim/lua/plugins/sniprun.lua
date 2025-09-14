return {
  'michaelb/sniprun',
  branch = 'master',
  enabled = function() return vim.fn.has('win32') ~= 1 end,
  build = 'sh install.sh',
  cmd = { 'SnipRun', 'SnipInfo', 'SnipLive', },
  config = function()
    require('sniprun').setup({
      -- your options
    })
  end,
  keys = {
    { '<leader>c', '<Plug>SnipRun',         silent = true, mode = { 'v', 'n' }, desc = 'Sniprun' },
    { '<leader>C', '<Plug>SnipRunOperator', silent = true, mode = { 'n' },      desc = 'SnipRunOperator' },
  },
}
