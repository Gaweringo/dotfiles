return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- These languages should be installed by default
      -- stylua: ignore
      local languages = {
        'arduino', 'bash', 'bibtex', 'c', 'c_sharp', 'caddy', 'cmake', 'cpp', 'css', 'csv', 'dart', 'desktop',
        'devicetree', 'diff', 'disassembly', 'dockerfile', 'doxygen', 'ebnf', 'editorconfig', 'fish', 'git_config',
        'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'html', 'ini', 'jq', 'json', 'json5', 'julia',
        'just', 'kconfig', 'kitty', 'latex', 'lua', 'make', 'markdown', 'markdown_inline', 'matlab', 'mermaid', 'ninja',
        'nix', 'objdump', 'powershell', 'printf', 'python', 'query', 'regex', 'rst', 'rust', 'sql', 'ssh_config',
        'strace', 'sway', 'systemverilog', 'tcl', 'toml', 'typst', 'udev', 'vhdl', 'vim', 'vimdoc', 'xml', 'yaml',
        'zig',
      }
      local no_ts_indent = { --[[ 'vhdl' ]] }

      local nvts = require 'nvim-treesitter'
      local available_parsers = nvts.get_available()

      -- mostly taken from MINIMAX:
      -- https://github.com/nvim-mini/MiniMax/blob/1f49c6585d5f9a9837c271636dab4c572ee18ae7/configs/nvim-0.11/plugin/40_plugins.lua#L15-L73

      -- Install the required languages
      local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
      end
      local to_install = vim.tbl_filter(isnt_installed, languages)
      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end

      local augrp = vim.api.nvim_create_augroup('treesitter.setup', {})

      -- Start treesitter in buffers with filetypes for which a parser is installed
      local filetypes = {}
      local installed_langs = nvts.get_installed()
      for _, lang in ipairs(installed_langs) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
          table.insert(filetypes, ft)
        end
      end
      local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
        -- indentation, provided by nvim-treesitter
        local ft = ev.match
        if not vim.list_contains(no_ts_indent, ft) then
          local lang = vim.treesitter.language.get_lang(ft)
          if lang then
            local has_indent_query = #vim.api.nvim_get_runtime_file('queries/' .. lang .. '/indents.scm', false) == 1
            if has_indent_query then
              vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
        end
      end
      vim.api.nvim_create_autocmd('FileType', {
        group = augrp,
        pattern = filetypes,
        callback = ts_start,
        desc = 'Activate treesitter for the given filetype',
      })


      -- Inform user if a parser exists for a language and it isn't installed
      -- or a installed parser is not in the list of languages
      local already_checked_fts = {}

      vim.api.nvim_create_autocmd('FileType', {
        group = augrp,
        callback = function(args)
          local filetype = args.match

          -- No need to check filetypes twice
          if vim.list_contains(already_checked_fts, filetype) then
            return
          end

          local installed_parsers = nvts.get_installed()
          local language = vim.treesitter.language.get_lang(filetype)

          if language then
            local is_available = vim.list_contains(available_parsers, language)
            local is_installed = vim.list_contains(installed_parsers, language)
            local in_lang_list = vim.list_contains(languages, language)
            if is_available and not is_installed then
              vim.notify_once('A parser for ' .. language .. ' is available but not installed.')
            end
            if is_installed and not in_lang_list then
              vim.notify_once('A parser for ' .. language .. ' is installed but not in language list.'
                .. ' Consider adding it in the config.')
            end
          end
          table.insert(already_checked_fts, filetype)
        end,
      })

      vim.api.nvim_create_user_command('TSReload', function()
        vim.cmd 'Lazy! reload nvim-treesitter'
        vim.cmd 'doautocmd FileType'
      end, { desc = 'Reload nvim treesitter to load newly installed parsers' })

      vim.api.nvim_create_user_command('TSStart', function()
        local ev = {}
        ev.buf = vim.api.nvim_get_current_buf()
        ev.match = vim.bo.filetype
        ts_start(ev)
      end, { desc = 'Start treesitter for the current buffer' })

      -- Parser for ARM Assembly (old version, need to update to new treesitter)

      -- parser_config.arm = {
      --   install_info = {
      --     url = 'https://github.com/SethBarberee/tree-sitter-asm',
      --     files = { 'src/parser.c' },
      --     -- optional entries:
      --     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      --     requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      --   },
      --   filetype = 'arm', -- if filetype does not match the parser name
      -- }
      --
      -- -- Make arm the default filetype for assembly files
      -- vim.g.asmsyntax = 'arm'

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    -- Syntax aware textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          -- Type of selection for specific nodes
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@function.inner'] = 'V', -- linewise
            ['@class.inner'] = 'V', -- linewise
            ['@class.outer'] = 'V', -- linewise
          },
        },
        move = {
          -- whether to set jumps in the jumplist
          set_jumps = true,
        },
      }

      --------- keymaps -------------------------------------------------------
      -- Swapping
      vim.keymap.set('n', '>a', function()
        require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
      end, { desc = 'Swap with next @parameter.inner' })
      vim.keymap.set('n', '<a', function()
        require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner'
      end, { desc = 'Swap with previous @parameter.inner' })
      vim.keymap.set('n', '>A', function()
        require('nvim-treesitter-textobjects.swap').swap_next '@parameter.outer'
      end, { desc = 'Swap with next @parameter.outer' })
      vim.keymap.set('n', '<A', function()
        require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer'
      end, { desc = 'Swap with previous @parameter.outer' })

      -- Selections
      local function map_sel(keymap, object, desc, query_group)
        query_group = query_group or 'textobjects'
        vim.keymap.set({ 'x', 'o' }, keymap, function()
          require('nvim-treesitter-textobjects.select').select_textobject(object, query_group)
        end, { desc = desc .. ' (' .. object .. ')' })
      end
      -- You can use the capture groups defined in `textobjects.scm`
      map_sel('aa', '@parameter.outer', 'Around argument')
      map_sel('ia', '@parameter.inner', 'Inside argument')

      map_sel('if', '@function.inner', 'Inside function')
      map_sel('af', '@function.outer', 'Around function')

      map_sel('ac', '@class.outer', 'Around class')
      map_sel('ic', '@class.inner', 'Inside class')

      -- You can also use captures from other query groups like `locals.scm`
      map_sel('as', '@local.scope', 'Scope', 'locals')

      -- Moves
      local function map_move(keymap, object, dir, desc, query_group)
        query_group = query_group or 'textobjects'
        desc = desc or ''
        if dir == nil then
          error 'Requires a direction'
        end
        if keymap == nil then
          error 'Requires a keymap'
        end
        if object == nil then
          error 'Requires object'
        end

        local func_name = 'goto_' .. dir

        vim.keymap.set({ 'n', 'x', 'o' }, keymap, function()
          require('nvim-treesitter-textobjects.move')[func_name](object, query_group)
        end, { desc = desc .. ' (' .. object .. ')' })
      end

      map_move(']f', '@function.outer', 'next_start', 'Next function start')
      map_move(']F', '@function.outer', 'next_end', 'Next function end')
      map_move('[f', '@function.outer', 'previous_start', 'Prev function start')
      map_move('[F', '@function.outer', 'previous_end', 'Prev function end')

      map_move(']r', '@return.outer', 'next', 'Next Return')
      map_move('[r', '@return.outer', 'previous', 'Previous Return')

      map_move(']C', '@class.outer', 'next_start', 'Next Class')
      map_move('[C', '@class.outer', 'previous_start', 'Previous Class')

      map_move(']k', '@call.outer', 'next_start', 'Previous call (kall)')
      map_move('[k', '@call.outer', 'previous_start', 'Previous call (kall)')

      local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- Make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
  {
    -- Show the current scope at the top. (Sticky)
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = { mode = 'cursor', max_lines = 3, trim_scope = 'outer' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
