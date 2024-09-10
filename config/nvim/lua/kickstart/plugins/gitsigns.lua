-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      -- From: https://github.com/omerxx/dotfiles/blob/adf1479447d2a70f882954657f0a0d32e2de8d22/nvim/lua/plugins/gitsigns.lua
      on_attach = function(bufnr)
        require('which-key').add {
          { '<leader>h', group = '[H]unks (gitsigns)' },
          { '<leader>h_', hidden = true },
        }

        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Next change' })

        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Previous change' })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = '[s]tage' })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = '[r]eset' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>ha', gs.stage_hunk, { desc = '[a]dd (stage)' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[u]ndo stage' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = '[p]review' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = true }
        end, { desc = '[b]lame line' })
        map('n', '<leader>hB', gs.toggle_current_line_blame, { desc = 'toggle line [B]lame' })
        map('n', '<leader>hd', gs.diffthis, { desc = '[d]iff this' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = '[D]iff this ~' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    },
    init = function()
      -- From: https://github.com/tpope/vim-fugitive/issues/1517#issuecomment-1844796794
      -- With modified condition and added `vim.defer_fn`, as otherwise the refresh would not work correctly
      -- when using `GitSignsChanged` autocommand.
      local function reload_fugitive_index()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local bufname = vim.api.nvim_buf_get_name(buf)
          if vim.startswith(bufname, 'fugitive:') and (string.find(bufname, '.git//0/') or string.find(bufname, '.git')) then
            vim.defer_fn(function()
              vim.api.nvim_buf_call(buf, function()
                vim.cmd.edit() -- refresh the buffer
              end)
            end, 50)
          end
        end
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'GitSignsChanged',
        callback = reload_fugitive_index,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
