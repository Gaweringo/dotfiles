return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff1_plain',
      },
    },
  },
  -- For icons
  dependencies = { 'echasnovki/mini.nvim' },
  init = function()
    -- Diffview only supports nvim-web-devicons, so we let mini.icons mock it
    require('mini.icons').mock_nvim_web_devicons()
  end,
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory', },
  keys = {
    { '<leader>gd%', '<cmd>DiffviewFileHistory %<cr>', desc = '[d]iffview current file' },
    { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>',   desc = '[d]iffview [h]istory' },
    { '<leader>gdd', '<cmd>DiffviewOpen<cr>',          desc = '[d]iffview [d]iff' },
    { '<leader>gdq', '<cmd>DiffviewClose<cr>',         desc = '[d]iffview [q]uit' },
  },
}
