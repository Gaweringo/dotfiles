-- based on:
-- - kickstart.nvim
-- - https://youtu.be/skW3clVG5Fo

require 'options'
require 'keymap'
require 'autocommands'

-------------------- Lazy --------------------

-- here begins lazy and plugins

-- Lazy bootstrap
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim, which loads all other plugins specified in the lua/plugins folder
require("lazy").setup({
    spec = {
        -- Plugin specs are located in the 'plugins' folder
        { import = 'plugins' },
    },
    diff = { cmd = 'diffview.nvim' },
    rocks = { enabled = false }, -- disable luarocks for now
    -- automatically check for plugin updates
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
})

