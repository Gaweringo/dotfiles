local function get_comment_string()
  local comment_str = vim.o.commentstring:gsub('%%s', '')
  return comment_str
end

return {
  s('todo',
    fmta([[
      <comment><todo>(<name>): <finish>
    ]],
      {
        comment = f(get_comment_string),
        todo = c(1, {
          t 'TODO',
          t 'NOTE',
          t 'INFO',
          t 'WARN',
          i(nil)
        }),
        name = i(2),
        finish = i(0)
      }
    )
  ),
}

