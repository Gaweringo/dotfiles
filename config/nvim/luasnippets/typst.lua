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
}
