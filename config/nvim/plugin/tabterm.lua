-- TODO: Use TabEnter autocommand to track last tab page and make :Tabterm behave
-- like a toggle to that tabpage and back to the last one
-- vim.api.nvim_get_current_tabpage()
-- :h tabpage.txt
-- Make it possible to open multible tab terms

vim.api.nvim_create_user_command('TTerm', function()
    vim.cmd.tabnew()
    vim.cmd.terminal()
    vim.cmd.startinsert({ bang = true })
end, { desc = 'Terminal in new Tab' })


vim.api.nvim_create_user_command('VTerm', function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.startinsert({ bang = true })
end, { desc = 'Vertical split terminal' })

