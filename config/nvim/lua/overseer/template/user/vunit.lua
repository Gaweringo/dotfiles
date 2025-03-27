function findVunitDir()
  local vunit_dir = vim.fs.find({ 'vunit' }, { limit = math.huge, type = 'directory', upward = true })[1]
  if vunit_dir == nil then
    vunit_dir = vim.fs.find({ 'vunit' }, { limit = math.huge, type = 'directory' })[1]
  end
  return vunit_dir
end

return {
  name = 'vunit test',
  builder = function()
    -- https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks
    local vunit_path = findVunitDir() or '.'
    return {
      cmd = 'python',
      args = { 'run.py', '-p 4' },
      cwd = vunit_path,
      -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#on_output_quickfix
      components = {
        'on_complete_notify',
        'on_exit_set_status',
        'default',
      },
    }
  end,
  condition = {
    filetype = { 'vhdl', 'python' },
    callback = function(search)
      -- Make sure the 'run.py' file exists in the cwd
      return findVunitDir() ~= nil

      -- print(vim.inspect(search))
      -- return true
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
