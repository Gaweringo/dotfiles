local wk = require 'which-key'

-- Toggles
wk.add {
  {
    '<leader>ts',
    '<cmd>setlocal spell!<cr>',
    desc = function()
      return '[t]urn [s]pell -> ' .. (vim.opt_local.spell:get() and 'OFF' or 'ON')
    end,
  },
  {
    '<leader>tL',
    function()
      if vim.opt_local.spelllang._value == 'en' then
        vim.opt_local.spelllang = 'de'
      else
        vim.opt_local.spelllang = 'en'
      end
    end,
    desc = function()
      local cur_lang = vim.opt_local.spelllang._value
      local new_lang = 'en'
      if cur_lang == 'en' then
        new_lang = 'de'
      end
      return '[t]urn [L]anguage spelllang ' .. cur_lang .. ' -> ' .. new_lang
    end,
  },
}
