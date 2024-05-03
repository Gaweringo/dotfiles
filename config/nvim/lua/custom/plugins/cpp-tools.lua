return {
  'liaozixin/nvim-cpptools',
  keys = {
    {
      '<leader>ci',
      function()
        require('cpptool').create_func_def()
      end,
      desc = '[c]reate [i]mplementation',
    },
  },
}
