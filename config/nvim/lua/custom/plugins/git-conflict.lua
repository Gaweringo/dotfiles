return {
  'akinsho/git-conflict.nvim',
  version = '*',
  opts = {
    list_opener = 'Trouble qflist',
    disable_diagnostics = true,
    highlights = {
      current = 'DiffText',
      incoming = 'DiffAdd',
      ancestor = 'DiagnosticVirtualTextInfo',
      -- current = 'DiagnosticVirtualTextInfo',
      -- incoming = 'DiagnosticVirtualTextHint',
      -- ancestor = 'DiagnosticVirtualTextError',
    },
  },
  config = true,
}
