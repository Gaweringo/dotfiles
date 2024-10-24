local wk = require 'which-key'

local new_bg_fn = function()
  local new_bg = 'dark'
  if vim.o.background == 'dark' then
    new_bg = 'light'
  end
  return new_bg
end

local new_tw_fn = function()
  local new_tw = 90
  if vim.o.textwidth ~= 0 then
    new_tw = 0
  end
  return new_tw
end

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
  {
    '<leader>tb',
    function()
      vim.o.background = new_bg_fn()
    end,
    desc = function()
      return '[t]oggle [b]ackground -> ' .. new_bg_fn()
    end,
  },
  {
    '<leader>tw',
    function()
      vim.o.textwidth = new_tw_fn()
      vim.o.colorcolumn = '+1'
    end,
    desc = function()
      return '[t]oggle text[w]idth -> ' .. new_tw_fn()
    end,
  },
}
