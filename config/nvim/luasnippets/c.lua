return {
  s(
    'header',
    fmta(
      [[
// ======================================================================
// Workfile     : <filename>
// Author       : Hanl Martin
// Date         : <date>
// Description  : <desc>
// Remarks      : -
// Revision     : 1
// ======================================================================

<finish>
]],
      {
        filename = d(3, function()
          return sn(nil, t(vim.fn.expand '%:t'))
        end),
        date = d(2, function(_, _)
          local birthdate = os.date('%Y-%m-%d', vim.loop.fs_stat(vim.fn.expand '%').birthtime.sec)
          return sn(nil, t(birthdate))
        end),
        desc = i(1),
        finish = i(0),
      }
    )
  ),
}, {
  s(
    '#indg',
    fmta(
      [[
#ifndef <file_name>
#define <file_name_same>
<finish>
#endif
]],
      {
        file_name = d(1, function()
          return sn(nil, t(string.upper(vim.fn.expand '%:t:r' .. '_' .. vim.fn.expand '%:t:e')))
        end),
        file_name_same = rep(1),
        finish = i(0),
      }
    )
  ),
  s(
    '//===',
    fmta(
      [[
    // ========== <section> ==========<finish>
    ]],
      {
        section = i(1),
        finish = i(0),
      }
    )
  ),
  postfix({ trig = ".nret", match_pattern = "[%w%.%_%->]+$", desc = 'Null check return' }, {
      l("if (" .. l.POSTFIX_MATCH .. " == NULL) { return"),
      c(1, {
        sn(nil, { t" ", i(1, ' false')} ),
        t"",
      }),
      t("; }"),
      t {"", ""}, -- newline
    }
  ),
  s('cosnt', { t "const" }), -- Misspelling of const
}
