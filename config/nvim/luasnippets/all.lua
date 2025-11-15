local function get_comment_string()
  local comment_str = vim.o.commentstring:gsub('%%s', '')
  return comment_str
end

return {
  s('todo',
    {
      f(get_comment_string), -- comment
      c(1, {
        t 'TODO',
        t 'NOTE',
        t 'INFO',
        t 'WARN',
        i(nil)
      }), -- Todo type
      c(2, { -- Optional name
          sn(nil, { t"(", i(1, "MaHa"), t ")", }),
          t "",
      }),
      t ": ",
      i(0),
    }
  ),
}

