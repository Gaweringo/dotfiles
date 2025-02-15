return {
  {
    'folke/tokyonight.nvim',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = 'night',
      -- transparent = true,
      styles = {
        -- sidebars = 'transparent',
        -- floats = 'transparent'
      },
    },
    -- init = function()
    --   -- Load the colorscheme here.
    --   -- Like many other themes, this one has different styles, and you could load
    --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --   vim.cmd.colorscheme 'tokyonight'
    --
    --   -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  {
    'slugbyte/lackluster.nvim',
    -- lazy = false,
    priority = 1000,
    -- init = function()
    -- vim.cmd.colorscheme 'lackluster'
    -- vim.cmd.colorscheme 'lackluster-hack' -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
    -- end,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
