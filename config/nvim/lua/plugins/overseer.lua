return {
  'stevearc/overseer.nvim',
  keys = {
    { '<leader>oo', '<cmd>OverseerRun<cr>',                                 desc = '[o]verseer run' },
    { '<leader>oO', '<cmd>OverseerToggle<cr>',                              desc = '[O]pen (toggle)' },
    { '<leader>oa', '<cmd>OverseerQuickAction<cr>',                         desc = 'Quick [a]ction' },
    { '<leader>or', '<cmd>OverseerQuickAction restart<cr>',                 desc = '[r]estart' },
    { '<leader>ow', '<cmd>OverseerQuickAction watch<cr>',                   desc = '[w]atch' },
    { '<leader>oe', '<cmd>OverseerQuickAction edit<cr>',                    desc = '[e]dit' },
    { '<leader>oq', '<cmd>OverseerQuickAction set quickfix diagnostic<cr>', desc = 'set [q]uickfix diagnostics' },
    { '<leader>oQ', '<cmd>OverseerQuickAction open output in quickfix<cr>', desc = 'open output in [Q]uickfix' },
    { '<leader>oT', '<cmd>OverseerQuickAction open tab<cr>',                desc = 'open output in [T]ab' },
    { '<leader>ov', '<cmd>OverseerQuickAction open vsplit<cr>',             desc = 'open output in [v]split' },
    { '<leader>os', '<cmd>OverseerQuickAction stop<cr>',                    desc = '[s]top' },
    { '<leader>os', '<cmd>OverseerQuickAction stop<cr>',                    desc = '[s]top' },
    { '<leader>ol', '<cmd>OverseerLoadBundle<cr>',                          desc = '[l]oad bundle' },
    { '<leader>os', '<cmd>OverseerSaveBundle<cr>',                          desc = '[s]ave bundle' },
    { '<leader>ob', '<cmd>OverseerBuild<cr>',                               desc = '[b]uild' },
  },
  opts = {
    templates = {
      'builtin',
      'user.xmake',
      'user.cpp_build',
      'user.vunit',
      'user.uv',
    },
    task_list = {
      max_height = { 20, 0.3 },
      height = 0.3,
      -- direction = 'right',
      bindings = {
        ["r"] = '<cmd>OverseerQuickAction restart<cr>',
        ["d"] = '<cmd>OverseerQuickAction dispose<cr>',
      },
    },
  },
  config = function(_, opts)
    require('overseer').setup(opts)

    -- https://github.com/stevearc/overseer.nvim/blob/master/doc/recipes.md#make-similar-to-vim-dispatch
    vim.api.nvim_create_user_command("Make", function(params)
      -- Insert args at the '$*' in the makeprg
      local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
      if num_subs == 0 then
        cmd = cmd .. " " .. params.args
      end
      local task = require("overseer").new_task({
        cmd = vim.fn.expandcmd(cmd),
        components = {
          { "on_output_quickfix", open = not params.bang, open_height = 8 },
          "default",
        },
      })
      task:start()
    end, {
      desc = "Run your makeprg as an Overseer task",
      nargs = "*",
      bang = true,
    })
  end,
  cmd = {
    'OverseerBuild',
    'OverseerRun',
    'OverseerInfo',
    'OverseerOpen',
    'OverseerQuickAction',
    'Make',
  },
}
