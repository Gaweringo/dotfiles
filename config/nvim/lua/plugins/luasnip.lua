return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  event = 'InsertEnter',
  dependencies = { 'rafamadriz/friendly-snippets' },
  opts = {
    history = true, enable_autosnippets = true, update_events = "TextChanged,TextChangedI",
  },
  config = function(_, opts)
    local ls = require 'luasnip'
    local types = require('luasnip.util.types')
    opts.ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = {{" ", "LspInlayHint"}}
        }
      },
      [types.insertNode] = {
        active = {
          virt_text = {{"●", "LspInlayHint"}}
        }
      }
    }
    ls.setup(opts)
    -- Use c snippets in cpp
    ls.filetype_extend('cpp', { 'c' })

    -- For loading frindly snippets (but is also done automatically by blink-cmp)
    require("luasnip.loaders.from_vscode").lazy_load()
    -- Lazy load snippets from vim.fn.stdpath('config')/luasnippets/*.lua
    require('luasnip.loaders.from_lua').lazy_load()

    vim.api.nvim_create_user_command('LuaSnipLog', function()
      require('luasnip').log.open()
    end, { desc = 'Show Luasnip logs' })

    vim.api.nvim_create_user_command('LuaSnipLog', function()
      require('luasnip').log.open()
    end, { desc = 'Show Luasnip logs' })

    vim.api.nvim_create_user_command('LuaSnipListAvailableInNewBuffer', function()
      require('luasnip.extras.snippet_list').open()
    end, { desc = 'List available snippets' })

    vim.api.nvim_create_user_command('LuaSnipSetLoglevel', function(p)
      require('luasnip').log.set_loglevel(p.args)
    end, { nargs = 1, desc = 'Show Luasnip logs' })

    vim.keymap.set({ 'i', 's' }, '<A-l>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true, desc = 'Next choice from snippet' })

    vim.keymap.set({ 'i', 's' }, '<A-h>', function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end, { silent = true, desc = 'Previous choice from snippet' })

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true, desc = 'Next choice from snippet' })

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end, { silent = true, desc = 'Previous choice from snippet' })
  end,
  keys = {
    {
      '<A-j>',
      function()
        if require('luasnip').choice_active() then
          require('luasnip.extras.select_choice')()
        end
        require('luasnip').expand()
      end,
      mode = { 'i', 's' },
      silent = true,
      desc = 'Show choice selection menu or insert snippet'
    },
    {
      '<leader>snS',
      function()
        require('luasnip.loaders').edit_snippet_files()
      end,
      silent = true,
      desc = 'Snippets to edit'
    }
  },
}

