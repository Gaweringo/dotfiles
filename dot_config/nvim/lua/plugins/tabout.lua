return {
  -- Easy navigation out of braces and quotation marks
  -- Read the documentation for more info on these options
  {
    "abecodes/tabout.nvim",
    enabled = false,
    name = "tabout.nvim",
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = true,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "*", close = "*" },
        },
        ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "text",
        }, -- tabout will ignore these filetypes
      })
    end,
  },
}
