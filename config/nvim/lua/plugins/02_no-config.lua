return {
  { 'tpope/vim-sleuth' }, -- automatic tabstop and shiftwidth detection

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, event = { 'VeryLazy', 'BufReadPre', 'BufNewFile' } },

  {
    -- Open messages in a live updating buffer
    'ariel-frischer/bmessages.nvim',
    commit = '985c6973bc27888598a03f4766a2481248a599b2',
    opts = {},
    cmd = { 'Bmessages', 'Bmessagesvs', 'Bmessagessp', 'BmessagesEdit' },
  },
  {
    enabled = false,
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      maxkeys = 5
    }
  }
}
