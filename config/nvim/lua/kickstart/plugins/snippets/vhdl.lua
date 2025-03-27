-- This clears snippets, so when I source this file
-- I can try the snippets again, without restarting neovim.
--
-- This is pretty useful if you're trying to do something a bit
-- more complicated or just exploring random snippet ideas
require('luasnip.session.snippet_collection').clear_snippets 'vhdl'

local ls = require 'luasnip'

local fmt = require('luasnip.extras.fmt').fmt
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
  s(
    'vunit',
    fmt(
      [[
library vunit_lib;
context vunit_lib.vunit_context;

entity {tb_name} is
  generic (runner_cfg : string);
end entity;

architecture tb of {tb_name} is
   signal clk    : std_ulogic := '0';
   signal nReset : std_ulogic := '0';
begin
  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop

      if run("{test_case1}") then
        report "This will pass";
        {finish}

      elsif run("{test_case2}") then
        assert false report "It fails";

      end if;
    end loop;

    test_runner_cleanup(runner);
  end process;

  clk <= not clk after ((1 sec)/cClkFrequency)/2;

end architecture;
    ]],
      {
        tb_name = d(1, function(args)
          return sn(nil, i(1, string.match(vim.fn.expand '%:t:r', '^[^-]+')))
        end),
        test_case1 = i(2, 'test_case1'),
        test_case2 = i(3, 'test_case2'),
        finish = i(0),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),
  s(
    'fsmd',
    fmt(
      [[
architecture Rtl of {entity_name} is

   type aRegSet is record
      {record_data}
   end record;

   signal R, NxR : aRegSet;

   constant cInitValR : aRegSet := (
      {finish}
   );

begin

   process({clk_name}, {reset_name})
   begin
      if {reset_name} = not '1' then
         R <= cInitValR;
      elsif rising_edge({clk_name}) then
         R <= NxR;
      end if;
   end process;

end architecture Rtl;
  ]],
      {
        entity_name = i(1),
        clk_name = i(2, 'iClk'),
        reset_name = i(3, 'inRstAsync'),
        record_data = i(4),
        finish = i(0),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),
})
