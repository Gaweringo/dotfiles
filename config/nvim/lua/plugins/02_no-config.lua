return {
  { 'tpope/vim-sleuth', lazy = false, keys = { { '<leader>ms', '<Cmd>Sleuth<Cr>', desc = 'Sleuth', silent = true } } },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, event = { 'VeryLazy', 'BufReadPre', 'BufNewFile' } },
  {
    enabled = false,
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      maxkeys = 5
    }
  }
}
