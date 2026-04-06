
------- WinYank ------------------------------------------------------------------------------------

local win_yank = { bufnr = nil, window = nil }

vim.api.nvim_create_user_command('WinYank', function ()
    win_yank.bufnr = vim.api.nvim_get_current_buf()
    win_yank.window = vim.api.nvim_get_current_win()
end, {})

vim.api.nvim_create_user_command('WinPaste', function ()
    local orig_config = vim.api.nvim_win_get_config(win_yank.window)
    if vim.api.nvim_open_win(win_yank.bufnr, true, orig_config) ~= 0 then
        vim.api.nvim_win_hide(win_yank.window)
    else
        vim.notify('Failed to paste window.')
    end
end, {})

vim.keymap.set('n', '<C-w>y', ':WinYank<CR>', { silent = true })
vim.keymap.set('n', '<C-w>p', ':WinPaste<CR>', { silent = true })
