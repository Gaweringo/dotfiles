return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.align').setup()

      require('mini.starter').setup()

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
        trySave()
        MiniSessions.select()
      end, { noremap = true, silent = true, desc = '[S]ession [s]witch' })

      vim.keymap.set('n', '<leader>Sw', trySave, { noremap = true, silent = true, desc = '[S]ession [w]rite' })

      vim.keymap.set('n', '<leader>Sl', function()
        MiniSessions.select()
      end, { noremap = true, silent = true, desc = '[S]ession [l]oad' })

      vim.keymap.set('n', '<leader>Sd', function()
        MiniSessions.select 'delete'
      end, { noremap = true, silent = true, desc = '[S]ession [d]elete' })
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
