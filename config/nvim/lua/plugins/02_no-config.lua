return {
  { 'tpope/vim-sleuth' }, -- automatic tabstop and shiftwidth detection

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
