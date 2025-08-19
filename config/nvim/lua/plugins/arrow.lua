return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "echasnovski/mini.nvim" },
  },
  event = 'VeryLazy',
  opts = {
    show_icons = true,
    leader_key = '-',        -- Recommended to be a single key
    buffer_leader_key = 'M', -- Per Buffer Mappings
    save_key = 'git_root',
  },
  keys = {
    {
      '<A-n>',
      function()
        require('arrow.persist').go_to(1)
      end,
      'Arrow first',
    },
    {
      '<A-m>',
      function()
        require('arrow.persist').go_to(2)
      end,
      'Arrow first',
    },
    {
      '<A-,>',
      function()
        require('arrow.persist').go_to(3)
      end,
      'Arrow first',
    },
    {
      '<A-.>',
      function()
        require('arrow.persist').go_to(4)
      end,
      'Arrow first',
    },
    {
      '<A-->',
      function()
        require('arrow.persist').go_to(5)
      end,
      'Arrow first',
    },
  },
}
