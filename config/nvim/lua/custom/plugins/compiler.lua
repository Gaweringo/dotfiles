return {
  { -- This plugin
    'Zeioth/compiler.nvim',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    dependencies = { 'stevearc/overseer.nvim' },
    opts = {},
    keys = {
      -- Open compiler
      { '<leader>pp', '<cmd>CompilerOpen<cr>', { noremap = true, silent = true }, desc = '[p]lay compiler (open compiler options)' },

      -- Redo last selected option
      {
        '<leader>pr',
        '<cmd>CompilerStop<cr>' -- (Optional, to dispose all tasks before redo)
          .. '<cmd>CompilerRedo<cr>',
        { noremap = true, silent = true },
        desc = '[r]edo last compile',
      },

      -- Toggle compiler results
      { '<leader>pt', '<cmd>CompilerToggleResults<cr>', { noremap = true, silent = true }, desc = '[t]oggle compiler results' },
    },
  },
  { -- The task runner we use
    'stevearc/overseer.nvim',
    commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
