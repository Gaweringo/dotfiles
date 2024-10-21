return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff1_plain',
      },
    },
  },
  cmd = { 'DiffviewOpen' },
  keys = {
    { '<leader>gd%', '<cmd>DiffviewFileHistory %<cr>', desc = '[d]iffview current file' },
    { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>', desc = '[d]iffview [h]istory' },
    { '<leader>gdd', '<cmd>DiffviewOpen<cr>', desc = '[d]iffview [d]iff' },
    { '<leader>gdq', '<cmd>DiffviewClose<cr>', desc = '[d]iffview [q]uit' },
  },
}
