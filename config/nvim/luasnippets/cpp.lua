return { -- Normal snippets
  s({ trig = 'rfive', desc = 'Implement rule of five' },
    fmta([[
virtual ~<class_name>()<action>;
<class_name>(<class_name>&&)<action>;
<class_name>& operator=(<class_name>&&)<action>;
<class_name>(const <class_name>&)<action>;
<class_name>& operator=(const <class_name>&)<action>;
<finish>
      ]],
      {
        class_name = d(1, function()
          -- Find name of current class or struct
          local status, node = pcall(vim.treesitter.get_node)
          while status and node ~= nil do
            if node:type() == "struct_specifier" or node:type() == "class_specifier" then
              local name = node:field('name')
              if name == nil then break end
              name = name[1]
              if name == nil then break end
              name = vim.treesitter.get_node_text(name, 0)
              return sn(nil, { i(1, name) })
            end
            node = node:parent()
          end

          return sn(nil, { i(1, "ClassName") })
        end),
        action = c(2,
          {
            i(1, " = delete"),
            t "",
          }
        ),
        finish = i(0),
      },
      { repeat_duplicates = true }
    )
  )
}, { -- Autosnippets
}

