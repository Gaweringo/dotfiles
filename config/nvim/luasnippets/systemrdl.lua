return {
  s(
    'addrmap',
    fmta(
      [[
      addrmap <type_name> {
          name = "<name>";
          desc = "<desc>";
          <body>
      };
    ]],
      {
        type_name = i(1),
        name = i(2),
        desc = i(3),
        body = i(0),
      }
    )
  ),
  s(
    'reg',
    fmta(
      [[
      reg {
          name = "<name>";
          desc = "<desc>";
          <body>
      }<instance_name>;
    ]],
      {
        instance_name = c(1, { sn(nil, { t ' ', i(1) }), t '' }),
        name = i(2),
        desc = i(3),
        body = i(0),
      }
    )
  ),
  s(
    'field',
    fmta(
      [[
      field {
          name = "<name>";
          desc = "<desc>";<body>
      }<instance_name>;
    ]],
      {
        instance_name = c(1, {
          sn(nil, { t ' ', i(1) }),
          t '',
        }),
        name = i(2),
        desc = i(3),
        body = i(0),
      }
    )
  ),
  s(
    'mem',
    fmta(
      [[
      mem <type_name> {
          mementries = <entries>;
          memwidth = <width>;<body>
      };
    ]],
      {
        type_name = i(1),
        entries = i(2),
        width = i(3),
        body = i(0),
      }
    )
  ),
  s(
    'enum',
    fmta(
      [[
      enum <type_name> {
          <entry> { desc = "<desc>"; };
          <body>
      };
      encode = <type_name>;
    ]],
      {
        type_name = i(1),
        entry = i(2),
        desc = i(3),
        body = i(0),
      }, {
        repeat_duplicates = true;
      }
    )
  ),
}, {}
