return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    enabled = false, -- using snacks
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      scope = { enabled = false },
    },
  },
}
