return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
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
      -- Next change
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Next change' })

      -- Previous change
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
      map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk, { desc = '[s]tage' })
      map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, { desc = '[r]eset' })
      map('n', '<leader>hS', gs.stage_buffer, { desc = '[S]tage buffer' })
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
}

