-- File browser
return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { 'echasnovski/mini.nvim' },
  config = function()
    -- Enable icons
    require('mini.icons').setup()

    local oil = require('oil')

    oil.setup({
      columns = {
        { 'mtime', highlight = 'Comment' },
        { 'size', highlight = 'Type' },
        'icon',
      }
    })

    vim.keymap.set('n', '<leader>f', oil.open, { desc = 'Open (f)older in Oil' })
  end,
}
