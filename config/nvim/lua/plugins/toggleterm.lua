return {
    'akinsho/toggleterm.nvim',
    opts = {
        autochdir = true, -- Follow nvim dir change on next open
    },
    cmd = { 'ToggleTerm', 'ToggleTermToggleAll' },
    keys = {
        -- Terminal
        { '<A-t>', '<Cmd>exe v:count1 . "ToggleTerm direction=float"<Cr>', desc = 'Floating Terminal', silent = true, mode = { 'n', 't', 'v' } },
        { '<A-z>', '<Cmd>exe v:count1 . "ToggleTerm direction=float"<Cr>', desc = 'Floating Terminal', silent = true, mode = { 'n', 't', 'v' } },
        { '<A-Z>', '<Cmd>exe v:count1 . "ToggleTerm direction=vertical size=120"<Cr>', desc = 'Tab Terminal', silent = true, mode = { 'n', 't', 'v' }, },
        { '<A-C-z>', '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal size=20"<Cr>', desc = 'Terminal', silent = true, mode = { 'n', 't', 'v' }, },
        -- Number two
        { '<A-u>', '<Cmd>2ToggleTerm direction=float<Cr>', desc = 'Floating Terminal', silent = true, mode = { 'n', 't', 'v' } },
        { '<A-U>', '<Cmd>2ToggleTerm direction=vertical size=120<Cr>', desc = 'Tab Terminal', silent = true, mode = { 'n', 't', 'v' }, },
        { '<A-C-u>', '<Cmd>2ToggleTerm direction=horizontal size=20<Cr>', desc = 'Terminal', silent = true, mode = { 'n', 't', 'v' }, },
        { '<leader>tt', '<Cmd>exe v:count1 . "ToggleTerm direction=float"<Cr>', desc = 'Terminal', silent = true },
        { '<leader>s\\', '<Cmd>TermSelect<Cr>', desc = 'Terminal', silent = true },
        {
            '<leader>T',
            function()
                require('toggleterm').send_lines_to_terminal('single_line', false, { args = vim.v.count })
                vim.cmd.stopinsert()
            end,
            desc = 'Send lines to terminal',
            mode = { 'n' },
            noremap = true,
        },
        {
            '<leader>T',
            function()
                require('toggleterm').send_lines_to_terminal('visual_selection', false, { args = vim.v.count })
                vim.cmd.stopinsert()
            end,
            desc = 'Send lines to terminal',
            mode = { 'v' },
        },
    },
}
