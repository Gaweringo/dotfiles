local opt = vim.opt

-- The global leader for most of the custom keymappings.
vim.g.mapleader = ' '

-- Local leader is used for file-type specific mappings.
-- For example the preview commands for markdown and typst both use <localleader>p
vim.g.localleader = '\\'

-- Set to true if you have a Nerd Font installed, so that
-- we get nice looking icons.
vim.g.have_nerd_font = true

----- basic options ------------------------------------------------------------
-- Show line numbers and make them relative to the cursor position
opt.number = true
opt.relativenumber = true

-- Disable visual wrapping of lines, as that is disorienting for code.
-- But because it can sometimes be useful, there is a keymap to
-- toggle the wrapping with <leader>tW
opt.wrap = false
-- If wrap is enabled, wrapped lines should continue with the current indentation
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

-- Only read modeline strings in first and last two lines of a file
vim.opt.modelines = 2

----- file handling ------------------------------------------------------------

-- Saving undo history to file, so it persists between neovim sessions
opt.undofile = true
 -- automatically reload files that changed outside of neovim
opt.autoread = true

----- indentation --------------------------------------------------------------
opt.tabstop = 8        -- Display width of an actual \t (tab character)
opt.shiftwidth = 4     -- Indentation used for (auto)indent and >> and << movements
opt.softtabstop = -1   -- Width of <Tab> when editing (inserting/deleting) (negative to use value of shiftwidth)
opt.expandtab = true   -- Insert spaces instead of tabs
opt.smartindent = true -- Smarter auto indentation for c-like files
opt.autoindent = true  -- Keep indent from current line

----- search / substitution ----------------------------------------------------
-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Preview substitutions live
opt.inccommand = 'split'

----- visual things ------------------------------------------------------------
-- Showing white space characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 500

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Keep signcolumn on by default, so that it doesn't jump around when stuff gets displayed / not displayed there
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

----- diagnostics --------------------------------------------------------------
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

----- splits and windows -------------------------------------------------------

-- Configure how new windows (:win :vwin) should be opened
opt.splitright = true -- :vwin puts new windows to the right
opt.splitbelow = true -- :win puts new windows at the bottom

-- Use vertical split as standard for :diffsplit
opt.diffopt:append 'vertical,linematch:60,algorithm:histogram'

----- behaviour ----------------------------------------------------------------
opt.hidden = true -- allow hidden buffers (to keep undo history and other things)

----- Filetypes ----------------------------------------------------------------

vim.filetype.add {
  filename = {
    -- Because tree-sitter has a parser specifically for kitty
    ['kitty.conf'] = 'kitty',
  },
  extension = {
    -- Do files for VHDL simulators are tcl files
    ['do'] = 'tcl'
  }
}

----- Neovide ------------------------------------------------------------------

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.85
  vim.o.guifont = "Iosevka NFM,IosevkaTerm NF,JetBrainsMono NF:h13"
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.9
  vim.g.neovide_hide_mouse_when_typing = 1
end

----- Windows ------------------------------------------------------------------

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

-- System clipboard for wsl
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
