return {
  'otavioschwanck/arrow.nvim',
  event = 'VeryLazy',
  opts = {
    show_icons = true,
    leader_key = 'ö', -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings
    relative_path = true,
  },
  keys = {
    {
      '<A-h>',
      function()
        require('arrow.persist').go_to(1)
      end,
      'Arrow first',
    },
    {
      '<A-j>',
      function()
        require('arrow.persist').go_to(2)
      end,
      'Arrow first',
    },
    {
      '<A-k>',
      function()
        require('arrow.persist').go_to(3)
      end,
      'Arrow first',
    },
    {
      '<A-l>',
      function()
        require('arrow.persist').go_to(4)
      end,
      'Arrow first',
    },
  },
}
