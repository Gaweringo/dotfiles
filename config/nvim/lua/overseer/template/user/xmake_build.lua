return {
  name = 'xmake build',
  builder = function()
    -- https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks
    return {
      cmd = 'xmake',
      args = { 'build' },
      -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#on_output_quickfix
      components = { { 'on_output_quickfix', open = true, close = true, set_diagnostics = true }, 'on_exit_set_status', 'default', 'on_result_diagnostics_trouble' },
      -- NOTE: Maybe needed?
      env = {
        XMAKE_COLORTERM = 'nocolor',
      },
    }
  end,
  condition = {
    -- filetype = { 'cpp', 'c' },
    callback = function(search)
      -- Make sure the 'xmake.lua' file exists in the cwd
      local stat = vim.loop.fs_stat 'xmake.lua'
      return stat and stat.type == 'file'

      -- print(vim.inspect(search))
      -- return true
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
