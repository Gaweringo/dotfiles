-- Keybind hints
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        spec = {
            { '<leader>S',   group = '[S]ession' },
            { '<leader>S_',  hidden = true },
            { '<leader>d',   group = '[d]ebug' },
            { '<leader>d_',  hidden = true },
            { '<leader>g',   group = '[g]it' },
            { '<leader>g_',  hidden = true },
            { '<leader>gd',  group = '[d]diffview' },
            { '<leader>gd_', hidden = true },
            { '<leader>gs',  group = '[g]it [s]earch' },
            { '<leader>gs_', hidden = true },
            { '<leader>l',   group = '[L]SP' },
            { '<leader>l_',  hidden = true },
            { '<leader>o',   group = '[o]verseer' },
            { '<leader>o_',  hidden = true },
            { '<leader>r',   group = '[r]efactor' },
            { '<leader>r_',  hidden = true },
            { '<leader>s',   group = '[S]earch' },
            { '<leader>s_',  hidden = true },
            { '<leader>t',   group = '[t]oggle' },
            { '<leader>t_',  hidden = true },
            { '<leader>w',   group = '[W]orkspace' },
            { '<leader>w_',  hidden = true },
            { '<leader>x',   group = 'Trouble' },
            { '<leader>x_',  hidden = true },
        }
    },
}
