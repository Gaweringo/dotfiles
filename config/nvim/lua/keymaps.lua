-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, flaot = true }
end, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, flaot = true }
end, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '[D', function()
  vim.diagnostic.jump { count = 1, flaot = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous Error [D]iagnostic message' })
vim.keymap.set('n', ']D', function()
  vim.diagnostic.jump { count = -1, flaot = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next Error [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- CUSTOM
vim.keymap.set('i', 'jj', '<Esc>', { silent = true, noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { silent = true, noremap = true })

-- Ctrl-Backspace to delete whole word in insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>')

-- Do not jump to next match with *
-- https://stackoverflow.com/a/4257175
vim.keymap.set('n', '*', ':keepjumps normal! mi*`i<CR>', { silent = true, noremap = true })

-- Toggles (also in keymaps-which-key.lua)
vim.keymap.set('n', '<leader>tth', '<cmd>TSBufToggle highlight<cr>', { desc = '[t]oggle [t]reesitter [h]ighlight' })

-- Keep selection after indenting with '<' and '>'
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Tabs
vim.keymap.set('n', '<C-w><C-l>', ':tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<C-w><C-h>', ':tabprevious<cr>', { desc = 'Previous tab' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>f', '<cmd>Oil<cr>', { desc = '[f]iles (Open explorer/netrw)' })

-- buffers
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous Buffer' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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

-- Show man page
vim.keymap.set('n', 'gm', function()
  vim.api.nvim_feedkeys('K', 'n', false)
end, { desc = 'Hover man' })

-- Make keybind
vim.keymap.set('n', '<leader>pm', ':make ', { desc = '[m]ake' })

-- Clear quickfix list
vim.keymap.set('n', '<leader>xc', '<cmd>call setqflist([])<CR>', { desc = '[c]lear quickfix list' })

-- Alternate file
vim.keymap.set('n', '<leader><CR>', '<C-^>', { desc = 'alternate file' })

-- vim: ts=2 sts=2 sw=2 et
