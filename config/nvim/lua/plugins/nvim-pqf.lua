return {
  -- TODO: Maybe switch to quicker.nvim or trouble.nvim
  'yorickpeterse/nvim-pqf',
  opts = {
    signs = {
      error = { text = '✘', hl = 'DiagnosticSignError' },
      warning = { text = ' ', hl = 'DiagnosticSignWarn' },
      info = { text = ' ', hl = 'DiagnosticSignInfo' },
      hint = { text = '󰌵', hl = 'DiagnosticSignHint' },
    },
  },
}
