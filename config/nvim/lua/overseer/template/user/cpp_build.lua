---@type overseer.TemplateFileDefinition
return {
  name = 'clang++ build',
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = "clang++",
      args = { file },
      components = { { "on_output_quickfix", open = true }, "on_result_diagnostics", "default" },
    }
  end,
  condition = {
    filetype = { "cpp" }
  },
}
