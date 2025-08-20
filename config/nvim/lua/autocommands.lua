-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local augroup = vim.api.nvim_create_augroup('startup_ag', {})

-- Auto resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    -- Don't do it for oil buffers
    if dir:match('oil://') then
      return
    end
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Mappings for command-line window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    -- Start in insert mode
    -- vim.cmd('startinsert')
    -- Escape to exit command-line window
    vim.keymap.set('n', '<Esc>', '<Cmd>quit<Cr>', { silent = true, buffer = true })
  end,
})

-- Auto close when specific windows are last
local bt_autoclose = { 'terminal', 'nofile' }
local ft_autoclose = { 'snacks_', 'dapui_', 'dap%-repl', 'dap%-view', 'qf', 'Overseer', }
local ft_autoclose_ignore = { 'snacks_dashboard' }

local list_wins = function()
  local all, close, rest = vim.api.nvim_list_wins(), {}, {}
  for _, win in ipairs(all) do
    local config = vim.api.nvim_win_get_config(win)
    local buf = vim.api.nvim_win_get_buf(win)
    local wininfo = vim.fn.getwininfo(win)[1]
    local is_ignore = vim.iter(ft_autoclose_ignore):any(function(pat)
      return string.match(vim.bo[buf].ft, pat)
    end)
    local is_bt = vim.iter(bt_autoclose):any(function(pat)
      return string.match(vim.bo[buf].bt, pat)
    end)
    local is_ft = vim.iter(ft_autoclose):any(function(pat)
      return string.match(vim.bo[buf].ft, pat)
    end)
    local is_float = config.relative ~= ''
    local is_qf = wininfo.quickfix == 1 or wininfo.loclist == 1
    if not is_ignore and (is_ft or is_bt or is_float or is_qf) then
      table.insert(close, win)
    else
      table.insert(rest, win)
    end
  end
  return all, rest, close
end

vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local _, wins, close = list_wins()
    local cur_win = vim.api.nvim_get_current_win()
    if #wins ~= 1 then
      return
    end
    -- Prevent quit when 'close' window is focused
    if vim.list_contains(close, cur_win) then
      return
    end
    if vim.list_contains(close, cur_win) then
      -- stylua: ignore
      vim.defer_fn(function() pcall(vim.cmd.quit) end, 100)
    end
    for _, win in ipairs(close) do
      pcall(vim.api.nvim_win_close, win, true)
    end
  end,
})
