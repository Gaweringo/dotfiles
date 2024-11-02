-- This clears snippets, so when I source this file
-- I can try the snippets again, without restarting neovim.
--
-- This is pretty useful if you're trying to do something a bit
-- more complicated or just exploring random snippet ideas
require('luasnip.session.snippet_collection').clear_snippets 'vhdl'

local ls = require 'luasnip'

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets('vhdl', {
  s(
    'header',
    fmta(
      [[
-------------------------------------------------------------------------------
-- Title      : <title>
-- Project    : <project>
-- Date       : <date>
-------------------------------------------------------------------------------
-- Abstract: <abstract>
-------------------------------------------------------------------------------
-- Authors are:
-- hanl: Martin Hanl
-------------------------------------------------------------------------------
<finish>
]],
      {
        title = d(4, function()
          return sn(nil, t(vim.fn.expand '%:t:r'))
        end),
        project = i(3),
        date = d(2, function(_, _)
          local birthdate = os.date('%Y-%m-%d', vim.loop.fs_stat(vim.fn.expand '%').birthtime.sec)
          return sn(nil, t(birthdate))
        end),
        abstract = i(1),
        finish = i(0),
      }
    )
  ),
  s(
    '----',
    fmta(
      [[
    -- ---------------------------------------- 
    -- <finish>
    -- ---------------------------------------- 
    ]],
      {
        finish = i(0),
      }
    )
  ),
})
