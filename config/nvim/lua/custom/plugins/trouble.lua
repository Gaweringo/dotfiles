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
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>do',
      '<cmd>Trouble lsp_document_symbols toggle focus=false win={size=80, position=right}<cr>',
      desc = '[d]ocument [o]utline LSP (Trouble)',
    },
    {
      '<leader>cS',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP references/definitions/... (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    { '[q', trouble_previous_repeat, desc = 'Previous Trouble/Quickfix Item' },
    { ']q', trouble_next_repeat, desc = 'Next Trouble/Quickfix Item' },
  },
  opts = {},
}
