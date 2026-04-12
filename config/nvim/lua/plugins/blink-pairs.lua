return {
  'saghen/blink.pairs',
  dependencies = { 'saghen/blink.download' },
  event = "InsertEnter",
  -- use a release tag to download pre-built binaries
  version = '*',

  ---@module 'blink.pairs'
  ---@type blink.pairs.Config
  opts = {
    mappings = {
      wrap = {
        ['<A-l>'] = 'treesitter',
        ['<A-h>'] = 'treesitter_reverse',
      },
    },
  },
}
