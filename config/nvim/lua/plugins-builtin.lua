------- TermDebug (gdb integration) ----------------------------------------------------------------

vim.cmd ':packadd termdebug'

vim.g.termdebug_config = {}

vim.api.nvim_create_user_command('TermdebugArm', function()
  vim.g.termdebug_config['command'] = { 'arm-none-eabi-gdb', '-ix', 'commands.gdb' }
end, { desc = 'Set up termdebug to use arm-none-eabi-gdb and run commands.gdb on startup' })


local original_mappings = {}

local debug_mode_mappings = {
  ['o'] = { ":call TermDebugSendCommand('next')<CR>", { desc = 'Step over', silent = true } },
  ['m'] = { ":call TermDebugSendCommand('step')<CR>", { desc = 'Step into ([m]ine down)', silent = true } },
  ['O'] = { ":call TermDebugSendCommand('nexti')<CR>", { desc = 'Step over instruction', silent = true } },
  ['M'] = { ":call TermDebugSendCommand('stepi')<CR>", { desc = 'Step into instruction ([M]ine down)', silent = true } },
  ['f'] = { ":call TermDebugSendCommand('info frame')<CR>", { desc = 'Frame info', silent = true } },
  ['F'] = { ":call TermDebugSendCommand('bt')<CR>", { desc = 'backtrace', silent = true } },
}

local function get_keymap(mode, lhs)
  local mode_maps = vim.api.nvim_get_keymap(mode)
  for _, map in ipairs(mode_maps) do
    if map.lhs == lhs then
      return map
    end
  end
  return nil
end

local augrp = vim.api.nvim_create_augroup('termdebug-mode', {})

-- Set up mappings for debugging
vim.api.nvim_create_autocmd('User', {
  group = augrp,
  pattern = 'TermdebugStartPost',
  callback = function(_)
    for key, map in pairs(debug_mode_mappings) do
      local orig_mapping = get_keymap('n', key)
      if orig_mapping ~= nil then
        original_mappings[key] = vim.fn.maparg(key, 'n', false, true)
      end
      vim.keymap.set('n', key, map[1], map[2])
    end
  end,
})

-- Restore mappings to what they were before debugging
vim.api.nvim_create_autocmd('User', {
  group = augrp,
  pattern = 'TermdebugStopPre',
  callback = function(_)
    for key, _ in pairs(debug_mode_mappings) do
      vim.keymap.del('n', key)
      local orig_mapping = original_mappings[key]
      if orig_mapping ~= nil then
        vim.fn.mapset('n', false, orig_mapping)
      end
    end
    original_mappings = {}
  end,
})
