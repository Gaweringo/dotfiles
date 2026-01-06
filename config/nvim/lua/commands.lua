vim.api.nvim_create_user_command('BashRunLine', [[.w !bash<Cr>]], { desc = 'Run in bash' })

vim.api.nvim_create_user_command('SyncCWD', function()
    local pwd = vim.uv.cwd()
    if pwd then
        vim.cmd({ cmd = 'cd', args = { pwd } })
    end
end, { desc = 'Sync the cwd of all tabs to this one' })

-- https://www.naseraleisa.com/posts/diff
-- Create a new scratch buffer
vim.api.nvim_create_user_command('Ns', function()
    vim.cmd([[
          execute 'vsplit | enew'
          setlocal buftype=nofile
          setlocal bufhidden=hide
          setlocal noswapfile
        ]])
end, { nargs = 0 })

-- Compare clipboard to current buffer
vim.api.nvim_create_user_command('CompareClipboard', function()
    local ftype = vim.api.nvim_eval('&filetype') -- original filetype
    vim.cmd([[
          tabnew %
    ]])
    vim.keymap.set({ 'n' }, 'q', '<Cmd>tabclose<Cr>', { desc = 'close', buffer = true })

    vim.cmd([[
          Ns
          normal! P
          windo diffthis
        ]])
    vim.cmd('set filetype=' .. ftype)
    vim.keymap.set({ 'n' }, 'q', '<Cmd>tabclose<Cr>', { desc = 'close', buffer = true })
end, { nargs = 0 })

-- Open command output in buffer
vim.api.nvim_create_user_command('B', function(opts)
    -- Without args it reruns the last command
    local command = vim.fn.histget('cmd', -2)
    if #opts.fargs ~= 0 then
        command = table.concat(opts.fargs, ' ')
    end
    if command == '' then
        vim.notify('No command in history to run')
        return
    end
    vim.cmd([[
    Ns
    setlocal filetype=B_buffer
        ]])
    vim.cmd([[put = execute(']] .. command .. [[')]])
    vim.keymap.set({ 'n' }, 'q', '<Cmd>:q<Cr>', { desc = 'close', buffer = true })
end, {
    nargs = '*',
    complete = function(arglead, cmdline, cursorpos)
        -- Forward completion to the default :buffer completion
        return vim.fn.getcompletion(arglead, 'cmdline')
    end,
    desc = 'Open command output in buffer',
})

-- Copy current working dir to system clipboard
vim.api.nvim_create_user_command('Pwdc', function()
  vim.cmd [[let @+ = trim(execute('pwd'))]]
end, { desc = 'Copy pwd to system clipboard' })

-- Copy path to folder of current file relative to the current working directory if possible
vim.api.nvim_create_user_command('CopyFolderPathOfCurrentFile', function()
    vim.cmd [[let @+ = trim(expand('%:.:h'))]]
end, { desc = 'Copy path to current files folder (relative to pwd) to system clipboard' })

-- Copy path to folder of current file
vim.api.nvim_create_user_command('CopyFolderPathOfCurrentFileFull', function()
    vim.cmd [[let @+ = trim(expand('%:p:h'))]]
end, { desc = 'Copy path to current files folder to system clipboard' })

-- Copy path to the current file relative to the current working directory if possible
vim.api.nvim_create_user_command('CopyCurrentFilePath', function()
    vim.cmd [[let @+ = trim(expand('%:.'))]]
end, { desc = 'Copy path to current file (relative to pwd) to system clipboard' })

-- Copy full path to the current file
vim.api.nvim_create_user_command('CopyCurrentFilePathFull', function()
    vim.cmd [[let @+ = trim(expand('%:p'))]]
end, { desc = 'Copy full path to current files folder to system clipboard' })

-- Clear the temp shada files (mostly for windows)
vim.api.nvim_create_user_command('ClearTempShada', function()
    local path = vim.fn.stdpath('data') .. '/shada/'
    local files = vim.fn.globpath(path, "*.tmp.[A-z]", true, true)
    vim.print(files)
    for _, file in ipairs(files) do
      vim.fs.rm(file)
    end
end, { desc = 'Delete *.tmp.[A-z] shada files' })

