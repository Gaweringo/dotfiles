-- https://www.naseraleisa.com/posts/diff
local function get_default_branch_name()
  local res = vim
      .system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true })
      :wait()
  return res.code == 0 and 'main' or 'master'
end

return {
  'dlyongemallo/diffview-plus.nvim',
  opts = {
    use_icons = true,
    -- enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = 'diff1_plain',
      },
      cycle_layouts = {
        default = { "diff1_inline", "diff1_plain", "diff2_horizontal", "diff2_vertical" },
      },
      -- inline = { style = "overleaf" },
    },
  },
  -- For icons
  dependencies = { 'nvim-mini/mini.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewToggle', 'DiffviewFileHistory', },
  keys = {
    { '<leader>gd%', '<cmd>DiffviewFileHistory --follow %<cr>',                                        desc = 'current file history' },
    { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>',                                                   desc = 'history' },
    { '<leader>gdl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>",                                desc = 'line history', mode = { 'v' } },
    { '<leader>gdl', "<Cmd>.DiffviewFileHistory --follow<CR>",                                         desc = 'line history', mode = { 'n' } },
    { '<leader>gdo', '<cmd>DiffviewOpen<cr>',                                                          desc = 'open' },
    { '<leader>gdd', '<cmd>DiffviewToggle<cr>',                                                        desc = 'diffview (toggle)' },
    { '<leader>gdw', '<cmd>DiffviewWorktreeOverview<cr>',                                              desc = 'worktree overview' },
    { '<leader>gdq', '<cmd>DiffviewClose<cr>',                                                         desc = 'quit' },
    { '<leader>gdm', function() vim.cmd('DivviewOpen ' .. get_default_branch_name()) end,              desc = 'main' },
    { '<leader>gdM', function() vim.cmd('DivviewOpen HEAD..origin/' .. get_default_branch_name()) end, desc = 'origin/[M]ain' },
  },
}
