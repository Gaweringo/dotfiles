return {
  'mbbill/undotree',

  keys = {
    { '<leader>u', vim.cmd.UndotreeToggle, desc = '[u]ndotree toggle' },
  },

  -- config = function()
  --   vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[u]ndotree toggle' })
  -- end,
}
