local M = {}

local function openTabterm()
    vim.cmd.tabnew()
    vim.cmd.terminal()
    vim.cmd.startinsert()
end

-- TODO: Use TabEnter autocommand to track last tab page and make :Tabterm behave
-- like a toggle to that tabpage and back to the last one
-- vim.api.nvim_get_current_tabpage()
-- :h tabpage.txt
-- Make it possible to open multible tab terms

vim.api.nvim_create_user_command('Tabterm', function()
    openTabterm()
end, {})

vim.keymap.set({'n', 'v'}, '<A-Z>', function() openTabterm() end, { desc = 'Tabterm' })

-- TODO: Create window pick and place plugin, so that you can press a keybind to pick up a window and press it again on
-- a different tabpage to drop it there (or maybe just use buffer search from Snacks picker)
