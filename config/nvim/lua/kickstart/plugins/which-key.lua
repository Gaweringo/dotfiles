-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup { icons = { mappings = false } }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>S', group = '[S]ession' },
        { '<leader>S_', hidden = true },
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>gd', group = '[d]diffview' },
        { '<leader>gd_', hidden = true },
        { '<leader>gs', group = '[g]it [s]earch' },
        { '<leader>gs_', hidden = true },
        { '<leader>l', group = '[L]SP' },
        { '<leader>l_', hidden = true },
        { '<leader>p', group = '[P]lay / Compile' },
        { '<leader>p_', hidden = true },
        { '<leader>r', group = '[r]efactor' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[t]oggle' },
        { '<leader>t_', hidden = true },
        { '<leader>tt', group = '[t]reesitter' },
        { '<leader>tt_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
        { '<leader>x', group = 'Trouble' },
        { '<leader>x_', hidden = true },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
