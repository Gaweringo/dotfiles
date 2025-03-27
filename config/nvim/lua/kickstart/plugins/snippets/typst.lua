-- This clears snippets, so when I source this file
-- I can try the snippets again, without restarting neovim.
--
-- This is pretty useful if you're trying to do something a bit
-- more complicated or just exploring random snippet ideas
require('luasnip.session.snippet_collection').clear_snippets 'typst'

local ls = require 'luasnip'

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets('typst', {
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
})
