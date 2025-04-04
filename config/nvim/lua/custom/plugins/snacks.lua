return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  dependencies = {
    -- To have todo_comments
    'folke/todo-comments.nvim',
  },
  opts = {
    picker = { enabled = true },
    image = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilActionsPost',
      callback = function(event)
        if event.data.actions.type == 'move' then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>tS'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tW'
        Snacks.toggle.diagnostics():map '<leader>td'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
        Snacks.toggle.treesitter():map '<leader>tT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tb'
        Snacks.toggle.inlay_hints():map '<leader>ti'
        Snacks.toggle.indent():map '<leader>tg'
        Snacks.toggle.dim():map '<leader>tD'
      end,
    })
  end,

  -- stylua: ignore
  keys = {
      -- INFO: essential keymaps
      { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Snack Smart" },
      { "<leader>sb", function() Snacks.picker.buffers({
        on_show = function (picker) picker.list:view(2) end
      })
      end, desc = "Buffers" },
      { "<leader>/", function()
        local _, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = oil_dir or vim.uv.cwd()
        Snacks.picker.grep({dirs = {cwd}})
      end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>E", function() Snacks.picker.explorer() end, desc = "Toggle File Tree Explorer" },
      -- find
      { "<leader>sf", function()
        local _, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = oil_dir or vim.uv.cwd()
        Snacks.picker.files({dirs = {cwd}})
      end, desc = "Find Files" },
      { "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>s.", function() Snacks.picker.recent() end, desc = "Recent" },
      -- git
      { "<leader>gsf", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>gsl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gss", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gsb", function() Snacks.picker.git_branches() end, desc = "Git branches" },
      { "<leader>gsc", function() Snacks.picker.git_commits() end, desc = "Git commits" },
      { "<leader>gsg", function() Snacks.picker.git_grep() end, desc = "Git grep" },
      -- grep
      { "<leader>sl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function()
        local _, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = oil_dir or vim.uv.cwd()
        Snacks.picker.grep({dirs = {cwd}})
      end, desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- search
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sL", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { '<leader>ss', function() Snacks.picker.pickers() end, desc = "Search Select Pickers" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo" },
      { "<leader>sz", function() Snacks.picker.zoxide() end, desc = "Zoxide" },
      { "<leader>sD", function()
        -- https://github.com/folke/snacks.nvim/issues/1036#issuecomment-2734330151
        -- Present the directories to the user for selection
        local _, oil_dir = pcall(require('oil').get_current_dir)
        local cwd = oil_dir or vim.uv.cwd()
        Snacks.picker.pick({
          title = "Directories",
          format = "text",
          cwd = cwd,
          finder = function(opts, ctx)
            local proc_opts = {
              cmd = "fd",
              args = { ".", "--type", "directory" },
            }
            return require("snacks.picker.source.proc").proc({ opts, proc_opts }, ctx)
          end,
          confirm = function(picker, item)
            picker:close()
            if item then
              vim.cmd("e " .. cwd .. item.text)
            end
          end,
        })
      end, desc = "Directories" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declarations" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ds", function() Snacks.picker.lsp_symbols({filter = {default = true}}) end, desc = "LSP Symbols" },
      { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- TODO: Go to directory in oil with sD
  },
}
