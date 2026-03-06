return {
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
    'vunit',
    fmt(
      [[
library vunit_lib;
context vunit_lib.vunit_context;

entity {tb_name} is
    generic (runner_cfg : string);
end entity;

architecture tb of {tb_name} is
    constant c_clk_freq   : positive     := 50e6;
    constant c_clk_period : delay_length := 1 sec / c_clk_freq;

    signal clk    : std_ulogic := '0';
    signal reset_n : std_ulogic := '0';
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

    clk <= not clk after c_clk_period / 2;

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
  s(
    'ram',
    fmt(
      [[
RAM : process({clk_name})
begin
  if rising_edge({clk_name}) then
    if {write_name} = '1' then
      {ram_name}(to_integer(unsigned({address_name}))) <= {data_name};
    end if;
    q <= {ram_name}({out_addr});
  end if;
end process RAM;
{finish}
    ]],
      {
        clk_name = i(1, 'iClk'),
        write_name = i(2, 'iWrite'),
        ram_name = i(3, 'Ram'),
        address_name = i(4, 'iAddress'),
        data_name = i(5, 'iWriteData'),
        out_addr = i(6, 'iAddress'),
        finish = i(0),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),
  s(
    'm_axistream_if',
    fmta(
      [[
      m_axis_tdata  : out std_ulogic_vector(<width>-1 downto 0);
      m_axis_tvalid : out std_ulogic;
      m_axis_tready : in std_ulogic;
      <optional><finish>
    ]],
      {
        width = i(1),
        optional = c(2, {
          t "",
          t "m_axis_tlast  : out std_ulogic;",
          sn(nil, { t "m_axis_tuser  : out std_ulogic_vector(", i(1), t "-1 downto 0);" }),
          sn(nil, {
            t { "m_axis_tlast  : out std_ulogic;", "" },
            t "m_axis_tuser  : out std_ulogic_vector(", i(1), t "-1 downto 0);",
          }),
        }),
        finish = i(0),
      }
    )
  ),
  s(
    's_axistream_if',
    fmta(
      [[
      s_axis_tdata  : in std_ulogic_vector(<width>-1 downto 0);
      s_axis_tvalid : in std_ulogic;
      s_axis_tready : out std_ulogic;
      <optional><finish>
    ]],
      {
        width = i(1),
        optional = c(2, {
          t "",
          t "s_axis_tlast  : in std_ulogic;",
          sn(nil, { t "s_axis_tuser  : in std_ulogic_vector(", i(1), t "-1 downto 0);" }),
          sn(nil, {
            t { "s_axis_tlast  : in std_ulogic;", "" },
            t "s_axis_tuser  : in std_ulogic_vector(", i(1), t "-1 downto 0);",
          }),
        }),
        finish = i(0),
      }
    )
  ),
  s(
    'axissignal',
    fmta(
      [[
      signal tdata  : std_ulogic_vector(<width>-1 downto 0);
      signal tvalid, tready, tlast : std_ulogic;
      <optional><finish>
    ]],
      {
        width = i(1),
        optional = c(2, {
          t "",
          t "signal tlast : std_ulogic;",
          sn(nil, { t "signal tuser  : std_ulogic_vector(", i(1), t "-1 downto 0);" }),
          sn(nil, {
            t { "signal tlast : std_ulogic;", "" },
            t "signal tuser : std_ulogic_vector(", i(1), t "-1 downto 0);",
          }),
        }),
        finish = i(0),
      }
    )
  ),
}, {
  s(
    '----',
    fmta(
      [[
    -- ------------------------------------------------------------------------
    -- <finish>
    -- ------------------------------------------------------------------------
    ]],
      {
        finish = i(0),
      }
    )
  ),
  s( 'sulv', { t 'std_ulogic_vector' }),
  s( 'slv', { t 'std_logic_vector' }),
  s( 'stdu', { t 'std_ulogic' }),
}
