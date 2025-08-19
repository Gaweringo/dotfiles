local trouble_next = function()
  if require('trouble').is_open() then
    require('trouble').next { skip_groups = true, jump = true }
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end
local trouble_previous = function()
  if require('trouble').is_open() then
    require('trouble').prev { skip_groups = true, jump = true }
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end

local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
local trouble_next_repeat, trouble_previous_repeat = ts_repeat_move.make_repeatable_move_pair(trouble_next, trouble_previous)

return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xD',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble/Treesitter)',
    },
    {
      '<leader>lo',
      '<cmd>Trouble lsp_document_symbols toggle focus=false win={size=80, position=right}<cr>',
      desc = '[l]sp [o]utline document (Trouble)',
    },
    {
      '<leader>lr',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP references/definitions/... (Trouble)',
    },
    {
      '<leader>ld',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<leader>lc',
      '<cmd>Trouble lsp_outgoing_calls toggle<cr>',
      desc = 'Outgoing (c)alls',
    },
    {
      '<leader>li',
      '<cmd>Trouble lsp_incoming_calls toggle<cr>',
      desc = '(i)ncoming calls',
    },
    -- { '[q', trouble_previous_repeat, desc = 'Previous Trouble/Quickfix Item' },
    -- { ']q', trouble_next_repeat, desc = 'Next Trouble/Quickfix Item' },
  },
  opts = {},
}
