return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip', 'echasnovski/mini.nvim', 'Kaiser-Yang/blink-cmp-git' },
  event = "InsertEnter",
  -- use a release tag to download pre-built binaries
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'none',
      -- Free: C-u

      ['<C-space>'] = { 'show_and_insert', 'show_documentation', 'hide_documentation' },
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

      ["<C-i>"] = { "select_and_accept", "fallback" },
      ['<C-e>'] = { 'hide' },
      ["<C-c>"] = { "cancel", "fallback" },

      -- Cycle through menu
      ['<C-p>'] = { 'show', 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'show', 'select_next', 'fallback_to_mappings' },

      -- Insert next completion without showing menu (cycling through like emacs)
      ["<C-j>"] = { "insert_next", "fallback" },
      ["<C-k>"] = { "insert_prev", "fallback" },

      -- Docs
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      -- Snippets
      ["<C-S-Space>"] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
      ["<C-l>"] = { "snippet_forward" },
      ["<C-h>"] = { "snippet_backward" },

    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = true, window = { border = 'rounded' } },
      menu = { auto_show = true, max_height = 20 },
      list = { selection = { preselect = true } },
    },

    -- Preselect false, to not have tab skip the first option
    cmdline = { completion = { list = { selection = { preselect = false } } } },

    signature = { enabled = true, window = { border  = 'rounded' } },

    snippets = { preset = 'luasnip' },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'git', 'omni' },
      -- TODO: Look for some providers which might be nice: https://cmp.saghen.dev/configuration/sources.html#community-sources
      providers = {
        git = {
          module = 'blink-cmp-git',
          name = 'Git',
          enabled = function ()
            return vim.tbl_contains({'gitcommit', 'markdown'}, vim.bo.filetype)
          end,
          opts = {},
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- boost priority
        },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
