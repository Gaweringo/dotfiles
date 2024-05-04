-- This clears my go snippets, so when I source this file
-- I can try the snippets again, without restarting neovim.
--
-- This is pretty useful if you're trying to do something a bit
-- more complicated or just exploring random snippet ideas
require('luasnip.session.snippet_collection').clear_snippets 'c'

local ls = require 'luasnip'

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets('c', {
  -- ls.parser.parse_snippet('#ifndefguard', '#ifndef $TM_FILENAME\n#define $TM_FILENAME\n$0\n#endif'),
  s(
    '#ifndefguard',
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
})
