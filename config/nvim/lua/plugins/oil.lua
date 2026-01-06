-- File browser
return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { 'nvim-mini/mini.nvim' },
  config = function()
    -- Enable icons
    require('mini.icons').setup()

    local oil = require('oil')

    oil.setup({
      columns = {
        { 'mtime', highlight = 'Comment' },
        { 'size', highlight = 'Type' },
        'icon',
      },
      keymaps = {
        ["<leader>To"] = { "actions.open_terminal" },
        ["H"] = { "<cmd>edit $HOME<Cr>", desc = "Open home directory" },
        ["<localleader>d"] = {
          function()
            local entry = oil.get_cursor_entry()
            local dir = oil.get_current_dir()

            if entry ~= nil then
              vim.system({ "dragon-drop", entry.name }, { cwd = dir })
            end
          end,
          desc = "Dragon-drop selected entry",
        },
      },
    })

    vim.keymap.set('n', '-', oil.open, { desc = 'Up one in Oil' })
    vim.keymap.set('n', '<leader>f', oil.open, { desc = 'Open (f)older in Oil' })
  end,
}
