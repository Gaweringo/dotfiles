return {
  {
    -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    version = '*', -- stable (use false for main branch)
    config = function()
      --------- Text Editing ---------
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      local gen_ai_spec = require('mini.extra').gen_ai_spec
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup({
        custom_textobjects = {
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          L = gen_ai_spec.line(),
          N = gen_ai_spec.number(),
          F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
          o = spec_treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          }),
        },
      })


      -- Align text interactively: [ ga ] and [ gA ]
      require('mini.align').setup()

      -- Not using mini.comment, because it does not support block comments
      -- using blink.cmp instead of mini.completion

      -- Move selection in visual mode with <M-hjkl> (Alt-hjkl)
      require('mini.move').setup()

      -- Evaluate with g= (e.g 1+1, ...), exchange with [ gX ], multiply with [ gm ] and replace with [ gr ] (similar to v_P)
      require('mini.operators').setup({ exchange = { prefix = 'gX' } })

      -- Split (seperate lines) and join (one line) parameters to functions with [ gS ]
      require('mini.splitjoin').setup()

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      --------- General workflow ---------
      -- For :Git commands
      require('mini.git').setup()

      -- Repeat f,F,t,T by pressing them again and make them multi line
      require('mini.jump').setup()

      -- TODO: Contemplate if it's a good idea to enable this (needs shada-f enabled aswell)
      require('mini.misc').setup()
      -- Remember cursor location for files
      MiniMisc.setup_restore_cursor()

      -- TODO: Figure out usage of Sessions and how they play with snacks project picker
      require('mini.sessions').setup()
      local trySave = function()
        if not pcall(MiniSessions.write) then
          local name = vim.fn.input 'New session name: '
          if name ~= nil and name ~= '' then
            MiniSessions.write(name)
          end
        end
      end

      vim.keymap.set('n', '<leader>Ss', function()
        vim.cmd 'wa'
        pcall(MiniSessions.write)
        MiniSessions.select()
      end, { noremap = true, silent = true, desc = '[S]ession [s]witch (makes \'sure\' to save current session)' })

      vim.keymap.set('n', '<leader>Sw', trySave, { noremap = true, silent = true, desc = '[S]ession [w]rite' })

      vim.keymap.set('n', '<leader>Sl', function()
        MiniSessions.select()
      end, { noremap = true, silent = true, desc = '[S]ession [l]oad' })

      vim.keymap.set('n', '<leader>Sd', function()
        MiniSessions.select 'delete'
      end, { noremap = true, silent = true, desc = '[S]ession [d]elete' })

      --------- Appearence ---------
      -- Dashboard
      require('mini.starter').setup()

      -- Statusline with more information
      require('mini.statusline').setup()

      -- Highlight and trim trailing whitespace
      -- To disable higlighting set vim.[b|g].minitrailspace_disable
      require('mini.trailspace').setup()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(ev)
          -- Toggleable with snacks toggle <leader>te
          if not vim.b.no_trim_trailspace then
            -- Only for 'normal' buffers (files)
            if vim.bo[ev.buf].buftype == '' then
              MiniTrailspace.trim()
            end
          end
        end,
      })

      vim.api.nvim_create_user_command(
        'TrimTrailspace',
        function() MiniTrailspace.trim() end,
        { desc = "Trim trailing whitespace" })
    end,
  },
}
