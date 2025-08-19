return {
  s(
    'tasks.json',
    fmta(
      [[
{
  "$schema": "https://raw.githubusercontent.com/wraith13/vscode-schemas/refs/heads/master/en/latest/schemas/tasks.json",
  "version": "2.0.0",
  "tasks": [
    {
      "label": "<label>",
      "type": "<type>",
      "command": "<command>",
      "args": [ <args> ]
    }
  ]
}
]],
      {
        label = i(1),
        type = c(2, {
          t 'process',
          t 'shell'
        }),
        command = i(3),
        args = i(0),
      }
    )
  ),
  s('task',
    fmta([[
    {
      "label": "<label>",
      "type": "<type>",
      "command": "<command>",
      "args": [ <args> ]
    }
    ]],
      {
        label = i(1),
        type = c(2, {
          t 'process',
          t 'shell'
        }),
        command = i(3),
        args = i(0),
      }
    )
  )
}
