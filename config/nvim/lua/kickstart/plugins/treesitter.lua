return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }

      -- Parser for ARM Assembly
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

      parser_config.arm = {
        install_info = {
          url = 'https://github.com/SethBarberee/tree-sitter-asm',
          files = { 'src/parser.c' },
          -- optional entries:
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = 'arm', -- if filetype does not match the parser name
      }

      -- Make arm the default filetype for assembly files
      vim.g.asmsyntax = 'arm'
      -- Set filetype for .arm files as arm
      -- vim.filetype.add { extension = { arm = 'arm' } }

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
