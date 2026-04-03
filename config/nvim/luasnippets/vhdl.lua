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
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity {tb_name} is
    generic (runner_cfg : string);
end entity;

architecture tb of {tb_name} is
    constant c_clk_freq   : positive     := 50e6;
    constant c_clk_period : delay_length := 1 sec / c_clk_freq;

    signal clk     : std_ulogic := '0';
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

    test_runner_watchdog(runner, 10 ms);

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
    'vunit_uvvm',
    fmt(
      [[
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

library uvvm_util;
context uvvm_util.uvvm_util_context;

library uvvm_vvc_framework;
context uvvm_vvc_framework.vvc_framework_context;

{vvc_libs}

entity {tb_name} is
    generic (runner_cfg : string);
end entity;

architecture tb of {tb_name} is
    constant c_clk_freq   : positive     := 50e6;
    constant c_clk_period : delay_length := 1 sec / c_clk_freq;

    signal clk     : std_ulogic := '0';
    signal reset_n : std_ulogic := '0';

begin

    -- ------------------------------------------------------------------------
    -- VVCs
    -- ------------------------------------------------------------------------

    engine: entity uvvm_vvc_framework.ti_uvvm_engine;

    -- ------------------------------------------------------------------------
    -- DUT
    -- ------------------------------------------------------------------------

    -- ------------------------------------------------------------------------
    -- Stimuli
    -- ------------------------------------------------------------------------

    main : process
    begin
        test_runner_setup(runner, runner_cfg);
        await_uvvm_initialization(VOID);

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

    test_runner_watchdog(runner, 10 ms);

    clock_generator(clk, c_clk_period);

end architecture;
    ]],
      {
        tb_name = d(1, function(args)
          return sn(nil, i(1, string.match(vim.fn.expand '%:t:r', '^[^-]+')))
        end),
        test_case1 = i(2, 'test_case1'),
        test_case2 = i(3, 'test_case2'),
        vvc_libs = i(4, { 'library bitvis_vip_axistream;', 'context bitvis_vip_axistream.vvc_context;' }),
        finish = i(0),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),
  s(
    'uvvm_axistream_setup',
    fmt(
      [[
    subtype axistream_if is t_axistream_if(
        tdata(c_data_width-1 downto 0), tkeep(c_data_width/8 -1 downto 0),
        tuser(c_user_width-1 downto 0), tstrb(1-1 downto 0), tid(0-1 downto 0), tdest(0-1 downto 0)
    );

    constant c_axistream_cfg : t_axistream_bfm_config := (
        max_wait_cycles                => 1000,
        max_wait_cycles_severity       => ERROR,
        clock_period                   => C_UNDEFINED_TIME,
        clock_period_margin            => 0 ns,
        clock_margin_severity          => TB_ERROR,
        setup_time                     => C_UNDEFINED_TIME,
        hold_time                      => C_UNDEFINED_TIME,
        bfm_sync                       => SYNC_ON_CLOCK_ONLY,
        match_strictness               => MATCH_EXACT,
        byte_endianness                => LOWER_BYTE_LEFT,
        valid_low_at_word_num          => 0,
        valid_low_multiple_random_prob => 0.5,
        valid_low_duration             => 0,
        valid_low_max_random_duration  => 5,
        check_packet_length            => false,
        protocol_error_severity        => ERROR,
        ready_low_at_word_num          => 0,
        ready_low_multiple_random_prob => 0.5,
        ready_low_duration             => 0,
        ready_low_max_random_duration  => 5,
        ready_default_value            => '0',
        id_for_bfm                     => ID_BFM
    );

    constant c_init_axis_if : axistream_if
        := init_axistream_if_signals(false, c_data_width, c_user_width, 0, 0, c_axistream_cfg);

    constant c_idx_{axis_m_again} : natural := 1;
    signal {axis_m}_if : axistream_if := c_init_axis_if;
    constant c_idx_{axis_s_again} : natural := 2;
    signal {axis_s}_if : axistream_if := c_init_axis_if;
    {finish}
    ]],
      {
        axis_m = i(1, 'axis_m'), axis_m_again = rep(1),
        axis_s = i(2, 'axis_s'), axis_s_again = rep(2),
        finish = i(0),
      },
      {
        -- repeat_duplicates = true,
      }
    )
  ),
  s(
    'axistream_vvc',
    fmt(
      [[
    {name}_vvc: entity bitvis_vip_axistream.axistream_vvc
     generic map(
        gc_vvc_is_master => {master},
        gc_data_width => {data_width},
        gc_user_width => {user_width},
        gc_id_width => 0,
        gc_dest_width => 0,
        gc_instance_idx => c_idx_{name_again},
        gc_axistream_bfm_config => {cfg}
    ) port map(clk, {name_again}_if);

    {finish}
    ]],
      {
        name = i(1, 'axis_m'), name_again = rep(1),
        master = i(2, 'true'),
        data_width = i(3, 'c_data_width'),
        user_width = i(4, 'c_user_width'),
        cfg = i(5, 'c_axistream_cfg'),
        finish = i(0),
      }
    )
  ),
  s(
    'fsmd',
    fmt(
      [[
architecture rtl of {entity_name} is

    type aState is (idle);

    type aRegSet is record
        state : aState;
        {record_data}
    end record;

    constant c_regset_init : aRegSet := (
        state => idle
        {finish}
    );

    signal R, NxR : aRegSet;

begin

    comb : process(all)
    begin
        NxR <= R;

        case R.state is
            when idle =>
            when others => report "Hit unhandled case: " & to_string(R.state) severity error;
        end case;
    end process;

    regs : process({clk_name}, {reset_name})
    begin
        if {reset_name} = not '1' then
            R <= c_regset_init;
        elsif rising_edge({clk_name}) then
            R <= NxR;
        end if;
    end process;

end architecture rtl;
  ]],
      {
        entity_name = d(1, function(args)
          return sn(nil, i(1, string.match(vim.fn.expand '%:t:r', '^[^-]+')))
        end),
        clk_name = i(2, 'i_clk'),
        reset_name = i(3, 'i_reset_n'),
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
        clk_name = i(1, 'i_clk'),
        write_name = i(2, 'i_write'),
        ram_name = i(3, 'RAM'),
        address_name = i(4, 'i_address'),
        data_name = i(5, 'i_write_data'),
        out_addr = i(6, 'i_address'),
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
        width = i(1, 'g_data_width'),
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
        width = i(1, 'g_data_width'),
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
  s('uvvm_axistream_cfg', fmt(
      [[
      constant {name} : t_axistream_bfm_config := (
          max_wait_cycles                => 1000,
          max_wait_cycles_severity       => ERROR,
          clock_period                   => C_UNDEFINED_TIME,
          clock_period_margin            => 0 ns,
          clock_margin_severity          => TB_ERROR,
          setup_time                     => C_UNDEFINED_TIME,
          hold_time                      => C_UNDEFINED_TIME,
          bfm_sync                       => SYNC_ON_CLOCK_ONLY,
          match_strictness               => MATCH_EXACT,
          byte_endianness                => LOWER_BYTE_LEFT,
          valid_low_at_word_num          => 0,
          valid_low_multiple_random_prob => 0.5,
          valid_low_duration             => 0,
          valid_low_max_random_duration  => 5,
          check_packet_length            => false,
          protocol_error_severity        => ERROR,
          ready_low_at_word_num          => 0,
          ready_low_multiple_random_prob => 0.5,
          ready_low_duration             => 0,
          ready_low_max_random_duration  => 5,
          ready_default_value            => '0',
          id_for_bfm                     => ID_BFM
      );{finish}
      ]],
      {
        name = i(1, 'c_axistream_cfg'),
        finish = i(0),
      }
    )),
  s('uvvm_axistream_if_type', fmt(
      [[
      subtype {name} is t_axistream_if(
          tdata({data_width}-1 downto 0), tkeep({data_width_again}/8 -1 downto 0),
          tuser({user_width}-1 downto 0), tstrb({strb_width}-1 downto 0), tid({id_width}-1 downto 0), tdest({dest_width}-1 downto 0)
      );{finish}
      ]],
      {
        name = i(1, 'axistream_if'),
        data_width = i(2, 'c_data_width'),
        data_width_again = rep(2),
        user_width = i(3, '0'),
        strb_width = i(4, '1'),
        id_width = i(5, '0'),
        dest_width = i(6, '0'),
        finish = i(0),
      }
    )),
  s('i_clocked', t { "i_clk : in std_ulogic;", "i_reset_n : in std_ulogic" }),
  s('uvvm_util', t { "library uvvm_util;", "context uvvm_util.uvvm_util_context;" }),
  s('uvvm_vvc_framework', t { "library uvvm_vvc_framework;", "context uvvm_vvc_framework.vvc_framework_context;" }),
  s('vip_axilite', t { "library bitvis_vip_axilite;", "context bitvis_vip_axilite.vvc_context;" }),
  s('vip_axistream', t { "library bitvis_vip_axistream;", "context bitvis_vip_axistream.vvc_context;" }),

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
  -- Misspellings
  s( 'sulv',   t 'std_ulogic_vector'),
  s( 'slv',    t 'std_logic_vector'),
  s( 'stdu',   t 'std_ulogic'),
  s( 'dowtno', t 'downto'),
  s( 'donwto', t 'downto'),
  s('othres',  t 'others'),
}
