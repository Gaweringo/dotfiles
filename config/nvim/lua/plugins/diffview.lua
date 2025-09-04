-- https://www.naseraleisa.com/posts/diff
local function get_default_branch_name()
  local res = vim
      .system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true })
      :wait()
  return res.code == 0 and 'main' or 'master'
end

return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff1_plain',
      },
    },
  },
  -- For icons
  dependencies = { 'echasnovki/mini.nvim' },
  init = function()
    -- Diffview only supports nvim-web-devicons, so we let mini.icons mock it
    require('mini.icons').mock_nvim_web_devicons()
  end,
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory', },
  keys = {
    { '<leader>gd%', '<cmd>DiffviewFileHistory --follow %<cr>',                                        desc = '[d]iffview current file' },
    { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>',                                                   desc = '[d]iffview [h]istory' },
    { '<leader>gdl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>",                                desc = '[d]iffview [l]ine history', mode = { 'v' } },
    { '<leader>gdl', "<Cmd>.DiffviewFileHistory --follow<CR>",                                         desc = '[d]iffview [l]ine history', mode = { 'n' } },
    { '<leader>gdd', '<cmd>DiffviewOpen<cr>',                                                          desc = '[d]iffview [d]iff' },
    { '<leader>gdq', '<cmd>DiffviewClose<cr>',                                                         desc = '[d]iffview [q]uit' },
    { '<leader>gdm', function() vim.cmd('DivviewOpen ' .. get_default_branch_name()) end,              desc = '[d]iffview [m]ain' },
    { '<leader>gdM', function() vim.cmd('DivviewOpen HEAD..origin/' .. get_default_branch_name()) end, desc = '[d]iffview origin/[M]ain' },
  },
}
