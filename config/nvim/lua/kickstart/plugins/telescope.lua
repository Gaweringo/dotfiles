-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
local telescope_dir = nil

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      ---@param opts table: options to pass to the picker
      ---@field hidden boolean: determines whether to show hidden and ignored files or not (default: false)
      ---@field cwd boolean: The directory the finder should be opened in
      ---@field default_text string: The text at the top of the picker
      local find_files = function(opts)
        opts = opts or {}
        local hidden = opts.hidden or false
        local default_text = opts.default_text or ''
        local prompt_title = 'Find Files'

        if hidden then
          prompt_title = prompt_title .. ' (hidden)'
        end

        local success, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = opts.cwd or oil_dir or vim.uv.cwd()
        telescope_dir = cwd

        builtin.find_files { cwd = cwd, hidden = hidden, no_ignore = hidden, prompt_title = prompt_title, default_text = default_text }
      end

      ---@param opts table: options to pass to the picker
      ---@field hidden boolean: determines whether to show hidden and ignored files or not (default: false)
      ---@field cwd boolean: The directory the finder should be opened in
      ---@field default_text string: The text at the top of the picker
      local live_grep = function(opts)
        opts = opts or {}
        local hidden = opts.hidden or false
        local default_text = opts.default_text or ''
        local prompt_title = 'Live Grep'

        if hidden then
          prompt_title = prompt_title .. ' (hidden)'
        end

        local success, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = opts.cwd or oil_dir or vim.uv.cwd()
        telescope_dir = cwd

        local grep_opts = {
          cwd = cwd,
          default_text = default_text,
          prompt_title = prompt_title,
        }
        if hidden then
          grep_opts.additional_args = { '--hidden', '--no-ignore' }
        end

        builtin.live_grep(grep_opts)
      end

      -- Toggles hidden file inclusion for `live_grep` and `find_files`
      local toggle_hidden = function(prompt_bufnr)
        local action_state = require 'telescope.actions.state'
        local line = action_state.get_current_line()

        local title = action_state.get_current_picker(prompt_bufnr).prompt_title
        if title:find 'Live Grep' then
          if title:find 'hidden' then
            live_grep { default_text = line, telescope_dir, cwd = telescope_dir }
          else
            live_grep { hidden = true, default_text = line, cwd = telescope_dir }
          end
        elseif title:find 'Find Files' then
          if title:find 'hidden' then
            find_files { default_text = line, telescope_dir, cwd = telescope_dir }
          else
            find_files { hidden = true, default_text = line, cwd = telescope_dir }
          end
        end
      end

      local actions = require 'telescope.actions'

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          -- mappings = {
          --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          -- },
          path_display = function(opts, path)
            local tail = require('telescope.utils').path_tail(path)
            return string.format('%s (%s)', tail, path)
          end,
          mappings = {
            i = {
              ['<a-h>'] = toggle_hidden,
              ['<C-Down>'] = actions.cycle_history_next,
              ['<C-Up>'] = actions.cycle_history_prev,
            },
            n = {
              ['q'] = actions.close,
            },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
      vim.keymap.set('n', '<leader>s:', builtin.command_history, { desc = '[s]earch [:]command history' })

      vim.keymap.set('n', '<leader>sf', find_files, { desc = '[s]earch [f]iles' })

      vim.keymap.set('n', '<leader>sF', function()
        find_files { hidden = true }
      end, { desc = '[s]earch with hidden [F]iles' })

      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]earch [s]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })

      vim.keymap.set('n', '<leader>sg', live_grep, { desc = '[s]earch by [g]rep' })
      vim.keymap.set('n', '<leader>sG', function()
        live_grep { hidden = true }
      end, { desc = '[s]earch by [G]rep hidden' })

      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[s]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', function()
        builtin.buffers { sort_lastused = true, sort_mru = true }
      end, { desc = '[ ] Find existing buffers' })

      -- git finds
      vim.keymap.set('n', '<leader>gsf', builtin.git_files, { desc = '[s]earch [g]it [f]iles' })
      vim.keymap.set('n', '<leader>gss', builtin.git_status, { desc = '[s]earch [g]it [s]tatus' })
      vim.keymap.set('n', '<leader>gsS', builtin.git_stash, { desc = '[s]earch [g]it [S]tash' })
      vim.keymap.set('n', '<leader>gsb', builtin.git_branches, { desc = '[s]earch [g]it [b]branches' })
      vim.keymap.set('n', '<leader>gsB', builtin.git_bcommits, { desc = '[s]earch [g]it [B]uffer commits' })
      vim.keymap.set('n', '<leader>gsc', builtin.git_commits, { desc = '[s]earch [g]it [c]ommits' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config', follow = true }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    'albenisolmos/telescope-oil.nvim',
    keys = { { '<leader>sD', '<cmd>Telescope oil<CR>', { noremap = true, silent = true }, desc = '[s]esarch [D]irectories' } },
    config = function()
      local settings = require 'telescope-oil.settings'
      settings.set { hidden = false }

      -- load extension
      require('telescope').load_extension 'oil'
    end,
    dependencies = { 'stevearc/oil.nvim', 'nvim-telescope/telescope.nvim' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
