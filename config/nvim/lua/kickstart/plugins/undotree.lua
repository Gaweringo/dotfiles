return {
  'mbbill/undotree',

  keys = {
    { '<leader>u', vim.cmd.UndotreeToggle, desc = '[u]ndotree toggle' },
  },

  init = function ()
    -- diff.exe is not included with nvim anymore
    -- use difftastic instead
    vim.g.undotree_DiffCommand = "difft"
  end
}
