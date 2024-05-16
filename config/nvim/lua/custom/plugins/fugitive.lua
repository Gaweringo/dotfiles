return {
  'tpope/vim-fugitive',
  dependencies = {
    -- For :GBrowse (open remote in browser)
    'tpope/vim-rhubarb',
  },
  cmd = {
    'G',
    'Git',
    'Gw',
    'Gwrite',
    'Gwq',
    'Gclog',
    'Gllog',
    'Gcd',
    'Gdiffsplit',
    'Gvdiffsplit',
    'GMove',
    'GRename',
    'GDelete',
    'GRemove',
    'GBrowse',
  },
  init = function()
    -- Because oil.nvim disables netrw and the standard url opener
    -- needs netrw. We need to define our own :Browse
    vim.api.nvim_create_user_command('Browse', function(opts)
      if vim.fn.has 'wsl' then -- 'wsl' also has 'win32', so is first
        vim.fn.system { 'cmd.exe', '/c', 'start', opts.fargs[1] }
      elseif vim.fn.has 'win32' then
        -- 'start' is a built-in in windows and can not be
        -- called in a list like the others. (i think)
        vim.fn.system('start ' .. opts.fargs[1])
      else
        vim.fn.system { 'xdg-open', opts.fargs[1] }
      end
    end, { nargs = 1 })
  end,
}
