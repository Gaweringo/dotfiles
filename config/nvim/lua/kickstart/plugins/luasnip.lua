return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',

    event = 'InsertEnter',

    dependencies = { 'rafamadriz/friendly-snippets' },

    opts = { history = true },

    config = function()
      local ls = require 'luasnip'
      ls.filetype_extend('javascript', { 'jsdoc' })

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/kickstart/plugins/snippets/*.lua', true)) do
        loadfile(ft_path)()
      end

      ls.filetype_extend('cpp', { 'c' })

      vim.keymap.set({ 'i', 's' }, '<C-E>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },
}
