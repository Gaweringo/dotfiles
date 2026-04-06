
------- BufYank ------------------------------------------------------------------------------------

local buffer_swap = {
    yanked = { bufnr = nil, window = nil },
}

vim.api.nvim_create_user_command('BufYank', function ()
    buffer_swap.yanked.bufnr = vim.api.nvim_get_current_buf()
    buffer_swap.yanked.window = vim.api.nvim_get_current_win()
end, {})

vim.api.nvim_create_user_command('BufSwap', function ()
    if buffer_swap.yanked.bufnr ~= nil and buffer_swap.yanked.window ~= nil then
        local current_buf = vim.api.nvim_get_current_buf()
        local current_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(buffer_swap.yanked.window, current_buf);
        vim.api.nvim_win_set_buf(current_win, buffer_swap.yanked.bufnr);
        buffer_swap.yanked = { bufnr = nil, window = nil }
    else
        vim.notify('No yanked buffer to swap with. Yank a buffer first with :BufYank')
    end
end, {})

vim.api.nvim_create_user_command('BufPaste', function ()
    if buffer_swap.yanked.bufnr ~= nil and buffer_swap.yanked.window ~= nil then
        local current_buf = vim.api.nvim_get_current_buf()
        local current_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(current_win, buffer_swap.yanked.bufnr);
        buffer_swap.yanked = { bufnr = current_buf, window = current_win }
    else
        vim.notify('No yanked buffer to swap with. Yank a buffer first with :BufYank')
    end
end, {})

vim.keymap.set('n', '<C-w>by', ':BufYank<CR>', { silent = true })
vim.keymap.set('n', '<C-w>bm', ':BufSwap<CR>', { silent = true })
vim.keymap.set('n', '<C-w>bp', ':BufPaste<CR>', { silent = true })
