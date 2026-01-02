-- The non plugin dependent keymaps
-- Keymaps for the plugins are (mostly) located in their (lazy) plugin spec

-- Disable higlighting of search by pressing esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Center screen when moving up and down
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { silent = true, noremap = true })

-- Ctrl-Backspace to delete whole word in insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>')

-- Alt+d/c to delete into the black hole register (yanked from helix)
vim.keymap.set({ 'n', 'v', 'x' }, '<A-d>', '"_d')
vim.keymap.set({ 'n', 'v', 'x' }, '<A-D>', '"_D')
vim.keymap.set({ 'n', 'v', 'x' }, '<A-c>', '"_c')
vim.keymap.set({ 'n', 'v', 'x' }, '<A-C>', '"_C')

-- Do not jump to next match with *
-- https://stackoverflow.com/a/4257175
vim.keymap.set('n', '*', ':keepjumps normal! mi*`i<CR>', { silent = true, noremap = true })

-- Keep selection after indenting with '<' and '>'
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Exit terminal mode with double ESC
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-k>', function() vim.cmd.wincmd 'k' end, { desc = 'Move out of terminal' })

-- Keep search directions the same, no matter if ? or / is used. n always goes forward and N always backwards.
-- https://superuser.com/a/1454131
vim.keymap.set({ 'n', 'v' }, 'n', '/<CR>', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'N', '?<CR>', { silent = true, noremap = true })

-- Clear quickfix list
vim.keymap.set('n', '<leader>xc', '<cmd>call setqflist([])<CR>', { desc = '[c]lear quickfix list' })

-- Open quickfix list
vim.keymap.set('n', '<leader>q', function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    -- botright to open it full width at bottom every time
    vim.cmd "botright copen"
  end
end, { desc = 'toggle [q]uickfix list' })

-- Alternate file
vim.keymap.set('n', '<leader><CR>', '<C-^>', { desc = 'alternate file' })

-- Show man page
vim.keymap.set('n', 'gM', '<Cmd>vert Man<Cr>', { desc = 'Hover man' })

-- Search and replace
vim.keymap.set('n', 'c*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> <Bs>]], { desc = 'Replace word' })

--- from mini.basics ---
local map = function(mode, lhs, rhs, opts)
  if lhs == '' then
    return
  end
  opts = vim.tbl_deep_extend('force', { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Move by visible lines. Notes:
-- - Don't map in Operator-pending mode because it severely changes behavior:
--   like `dj` on non-wrapped line will not delete it.
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
map('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
map('n', 'gP', '"+P', { desc = 'Paste from system clipboard' })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

-- Reselect latest changed, put, or yanked text
map('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })

-- Add empty lines before and after cursor line *not* supporting dot-repeat (see mini.basics for dot-repeat version)
map('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
map('n', 'go', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

-- Window resize (respecting `v:count`)
map('n', '<C-Left>', '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window width' })
map('n', '<C-Down>', '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window height' })
map('n', '<C-Up>', '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window height' })
map('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window width' })

------ movement ------

-- Tabs
vim.keymap.set('n', '<C-w><C-t>', ':tabnew<cr>', { desc = 'New Tab', silent = true })
vim.keymap.set('n', '<C-w><C-q>', ':tabclose<cr>', { desc = 'Close Tab', silent = true })
vim.keymap.set('n', '<C-w><C-l>', ':tabnext<cr>', { desc = 'Next Tab', silent = true })
vim.keymap.set('n', '<C-w><C-h>', ':tabprevious<cr>', { desc = 'Previous tab', silent = true })
vim.keymap.set('n', '<right>', ':tabnext<cr>', { desc = 'Next Tab', silent = true })
vim.keymap.set('n', '<left>', ':tabprevious<cr>', { desc = 'Previous tab', silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

----- diagnostic -------
-- Show virtual lines for current line (and behave like float -> close when moving away)
local prev_setting = vim.diagnostic.config()
local virt_line = function()
  local already_jumped = pcall(vim.api.nvim_del_augroup_by_name, 'line-diagnostics') -- prevent autocmd for opens
  if not already_jumped then
    prev_setting = vim.diagnostic.config()
  end
  vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }

  vim.defer_fn(function() -- deferred to not trigger by jump itself
    vim.api.nvim_create_autocmd('CursorMoved', {
      desc = 'User(once): Reset diagnostics virtual lines',
      group = vim.api.nvim_create_augroup('line-diagnostics', {}),
      once = true,
      callback = function()
        vim.diagnostic.config(prev_setting)
        return true
      end,
    })
  end, 1)
end

---@param jumpCount number
---@param severity? vim.diagnostic.SeverityFilter
local function jumpWithVirtLineDiags(jumpCount, severity)
  severity = severity or nil
  vim.diagnostic.jump { count = jumpCount, severity = severity }
  virt_line()
end

-- TODO: keymaps for moving to and showing diagnostic messages
vim.keymap.set('n', '[d', function()
  -- vim.diagnostic.jump { count = -1, float = true }
  jumpWithVirtLineDiags(-1)
end, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', function()
  -- vim.diagnostic.jump { count = 1, float = true }
  jumpWithVirtLineDiags(1)
end, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '[D', function()
  -- vim.diagnostic.jump { count = 1, flaot = true, severity = vim.diagnostic.severity.ERROR }
  jumpWithVirtLineDiags(1, vim.diagnostic.severity.ERROR)
end, { desc = 'Go to previous Error [D]iagnostic message' })
vim.keymap.set('n', ']D', function()
  -- vim.diagnostic.jump { count = -1, flaot = true, severity = vim.diagnostic.severity.ERROR }
  jumpWithVirtLineDiags(-1, vim.diagnostic.severity.ERROR)
end, { desc = 'Go to next Error [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>w', virt_line, { desc = '[w]hat are the diagnostics (virtual line)' })
vim.keymap.set('n', '<leader>L', vim.diagnostic.setloclist, { desc = 'Open diagnostics in [L]oclist' })

-- Macros / quick edits
vim.keymap.set('n', '<leader>m<Cr>', [[<Cmd>%s/\r//|norm!``<Cr>]], { desc = 'Remove trailing ^M', silent = true })
vim.keymap.set({ 'v', 'n' }, '<leader>m\\', [[<Cmd>s/\\/\\\\/g<Cr><Cmd>nohlsearch<Cr>]], { desc = 'Escape slashes (Change \\ to \\\\)', silent = true })
vim.keymap.set({'v', 'n' }, '<leader>m/', [[<Cmd>s/\\/\//g<Cr><Cmd>nohlsearch<Cr>]], { desc = 'Change \\ to /', silent = true })
vim.keymap.set('n', '<leader>mo', 'o<Esc>', { desc = 'Insert line below', silent = true })
vim.keymap.set('n', '<leader>mO', 'O<Esc>', { desc = 'Insert line above', silent = true })
vim.keymap.set('n', '<leader>md', function()
  local diffing = vim.o.diff
  if diffing then
    vim.cmd 'windo diffoff'
  else
    vim.cmd 'windo diffthis'
  end
end, { desc = 'Diff open windows', silent = true })

-- Count occurences of pattern in selection or file
vim.keymap.set('n', '<leader>mc', [[:%s///gen|nohlsearch<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]], { desc = 'Count occurences' })
vim.keymap.set('v', '<leader>mc', [[:s///gen|nohlsearch<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]], { desc = 'Count occurences' })

-- TODO: Autocommand to show virtual lines in insert mode and virtual text in normal mode

--------- Neovide ------------

if vim.g.neovide then
  -- Standard zooming keybinds for neovide
  local starting_scale_factor = vim.g.neovide_scale_factor
  vim.keymap.set({ 'n', 'v', 't', 'x', 'i' }, '<C-0>', function () vim.g.neovide_scale_factor = starting_scale_factor end, { desc = 'Neovide reset zoom', silent = true })
  vim.keymap.set({ 'n', 'v', 't', 'x', 'i' }, '<C-+>', function () vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end, { desc = 'Neovide zoom out', silent = true })
  vim.keymap.set({ 'n', 'v', 't', 'x', 'i' }, '<C-->', function () vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end, { desc = 'Neovide zoom out', silent = true })
end

-- Oh no! The mouse ~~~~
vim.keymap.set({ 'n', 'v', 's', 'i' }, '<X1Mouse>', '<C-i>', { desc = 'Forward' })
vim.keymap.set({ 'n', 'v', 's', 'i' }, '<X2Mouse>', '<C-o>', { desc = 'Backward' })
