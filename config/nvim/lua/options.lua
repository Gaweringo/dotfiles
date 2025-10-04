local opt = vim.opt

vim.g.mapleader = ' '
vim.g.localleader = '\\'
-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

---------- basic options --------
-- Show numbers and make them relative
opt.number = true
opt.relativenumber = true

opt.wrap = false
-- Enable break indent, to continue wrapped lines with current indentation
opt.breakindent = true
-- Number of lines to keep above and below cursor and left / right
opt.scrolloff = 8
opt.sidescrolloff = 5
-- How many lines C-d and C-u jump
opt.scroll = 15

-- Allow ability to jump back to discarded buffers
vim.opt.jumpoptions = "stack"

-- Let block select select virtual space (beyond end of line)
opt.virtualedit = "block"

------- file handling -------

-- Saving undo history to file, so it persits between neovim sessions
opt.undofile = true
opt.swapfile = false -- don't create swapfiles
opt.autoread = true  -- automatically reload files that changed outside of nvim

-------- indentation ---------
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true   -- spaces instead of tabs
opt.smartindent = true -- smarter auto indentation for c-like files
opt.autoindent = true  -- keep indent from current line

-------- search / substitution ---------
-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Preview substitions live
opt.inccommand = 'split'

---------- visual things --------------
-- Showing whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 500

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Keep signcolumn on by default, so that it doesn't jump around when stuff gets displayd / not displayed there
opt.signcolumn = 'yes'

opt.termguicolors = true  -- 24-bit color
opt.textwidth = 120
opt.colorcolumn = "+1"    -- vertical line at 120
-- opt.showmatch = true    -- highlight matching brackets
opt.matchtime = 2         -- how long to show matching brackets
opt.conceallevel = 0      -- don't conceal
opt.concealcursor = ""    -- don't conceal where the cursor is
opt.lazyredraw = true     -- don't redraw during macros
opt.cursorline = true     -- Highlight the line the cursor is on

------- diagnostics ----------
-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
  virtual_text = true,
  virtual_lines = false,
  update_in_insert = true,
  float = {
    border = 'rounded',
  },
})

------ splits and windows -------

-- Configure how new windows (:win :vwin) should be opened
opt.splitright = true
opt.splitbelow = true

-- Use vertical split as standard for :diffsplit
opt.diffopt:append 'vertical,linematch:60,algorithm:histogram'

------ behaviour --------
opt.hidden = true -- allow hidden buffers (to keep undo history and other things)

-------------------- Filetypes -------------------

-- Do files for VHDL simulators are tcl files
vim.filetype.add { extension = { ['do'] = 'tcl' } }

-------------------- Neovide ---------------------

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.85
  vim.o.guifont = "Iosevka NFM,IosevkaTerm NF,JetBrainsMono NF:h13"
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.9
end

if vim.fn.has('win32') == 1 and vim.fn.has('wsl') == 0 then
  -- Using powershell as the shell
  local powershell_options = {
    shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell', -- Using pwsh if available
    -- shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
    shellcmdflag = "-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;",
    shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode',
    shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode',
    shellquote = '',
    shellxquote = '',
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

