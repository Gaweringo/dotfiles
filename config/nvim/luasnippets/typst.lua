local postfix_ts = require("luasnip.extras.treesitter_postfix").treesitter_postfix

return {
  s(
    'qty',
    fmta(
      [[
qty("<num>", "<unit>")<finish>
]],
      {
        num = i(1),
        unit = i(2),
        finish = i(0),
      }
    )
  ),
  postfix_ts(
    { trig = '.fig', matchTSNode = { query = '(call) @prefix', query_lang = 'typst' },
      desc = 'Surround with figure',
      docstring = '#figure(call(param: val), caption: [$1])$0',
    },
    {
      d(1, function(_, parent)
        local match = parent.snippet.env.LS_TSMATCH

        local snippets = { t "figure(" }
        -- Insert captured text
        for i, m in ipairs(match) do
          if i == #match then
            table.insert(snippets, t(m))
          else
            table.insert(snippets, t {m, ""})
          end
        end
        -- Optional caption
        table.insert(snippets,
          sn(1, {
            c (1, { sn(nil, { t ", caption: [", i(1), t ']' } ), t("") }, { node_ext_opts = {} }),
            t ")",
            i(0),
            })
          )
        return sn(nil, snippets)
      end)
    }),
}, {
  s({ trig = 't(%d+)x(%d+)', trigEngine = "pattern", desc = "Table" },
      fmta([[
#table(
  rows: <rows>,
  columns: <cols>,
  <to_fill>
)
<finish>
        ]],
        {
          rows = dl(1, l.CAPTURE1, {}),
          cols = dl(2, l.CAPTURE2, {}),
          to_fill = d(3, function(args, parent, _old_state, _user_args)
            local rows = tonumber(args[1][1])
            local cols = tonumber(args[2][1])
            if rows == nil or cols == nil then return sn(nil, {}) end
            rows = math.floor(rows)
            cols = math.floor(cols)
            local nodes = {}
            for r=0,rows-1 do
              for c=0,cols-1 do
                vim.list_extend(nodes, { t "[", i(cols*r+1+c), t "]," })
              end
              if r ~= rows-1 then
                table.insert(nodes, t {"", "\t"})
              end
            end
            return sn(nil, nodes)
          end, {1, 2}),
          finish = i(0)
        }
      )
    ),
}
