return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      -- transparent = true, -- do not set background color
      colors = { theme = {
        wave = { ui = { bg = "none", bg_gutter = "none" } },
      } },
    },
    build = ':KanagawaCompile',
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      -- Fix cursor readability
      -- vim.cmd [[
      --   highlight Cursor guifg=#181818
      --   highlight NormalCursor guifg=#181818
      --   highlight TermCursor guifg=#181818
      --   highlight lCursor guifg=#181818
      --   highlight CursorIM guifg=#181818
      --   ]]
      -- Transparent background
      -- vim.cmd [[
      --   highlight Normal guibg=none
      --   highlight NonText guibg=none
      --   highlight Normal ctermbg=none
      --   highlight NonText ctermbg=none
      --   ]]
    end,
  }
}
