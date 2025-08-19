return {
  'michaelb/sniprun',
  branch = 'master',
  build = 'sh install.sh',
  cmd = { 'SnipRun', 'SnipInfo', 'SnipLive', },
  config = function()
    require('sniprun').setup({
      -- your options
    })
  end,
  keys = {
    { '<leader>r', '<Plug>SnipRun',         silent = true, mode = { 'v', 'n' }, desc = 'Snip[r]un' },
    { '<leader>R', '<Plug>SnipRunOperator', silent = true, mode = { 'n' },      desc = 'Snip[R]unOperator' },
  },
}
