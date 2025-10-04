return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'igorlfs/nvim-dap-view',
      'mason-org/mason.nvim',
      'theHamsta/nvim-dap-virtual-text',
      {
        'Joakker/lua-json5',
        build = function()
          if vim.fn.has('win32') == 1 and vim.fn.has('wsl') == 0 then
            vim.system({ 'powershell', './install.ps1' }):wait()
          else
            vim.system({ 'bash', './install.sh' }):wait()
          end
        end,
      }
    },
    init = function()
      -- Specify daps which should be installed
      local ensure_installed = {
        'cpptools',
        'cortex-debug',
        'codelldb',
      }
      local registry = require('mason-registry')
      for _, package_name in ipairs(ensure_installed) do
        if registry.has_package(package_name) and not registry.is_installed(package_name) then
          vim.print('Installing: ' .. package_name)
          registry.get_package(package_name):install()
        end
      end
    end,
    config = function()
      -- TODO: blink.cmp repl completion integration
      local dap = require('dap')
      -- Use json5 to support more laxed json style that .vscode/launch.json can use
      require('dap.ext.vscode').json_decode = require 'json5'.parse

      --- Highlighting and setup for the debug signs / icons ---
      -- https://github.com/mfussenegger/nvim-dap/discussions/355#discussioncomment-12928237
      -- augroup to be able to trigger the autocommand explicitly for the first time
      vim.api.nvim_create_augroup("dap_colors", {})

      -- autocmd to enforce colors settings on any color scheme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = "dap_colors",
        pattern = "*",
        desc = "Set DAP marker colors and prevent color theme from resetting them",
        callback = function()
          -- Reuse current SignColumn background (except for DapStoppedLine)
          local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
          -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
          -- convert to 6 digit hex value starting with #
          local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or ''
          local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or ''

          vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#FF9E3B', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
          vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
          vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#F44336', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
          vim.api.nvim_set_hl(0, 'DapBreakpointRejected',
            { fg = '#F4D3D6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
          vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61AFEF', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
          vim.api.nvim_set_hl(0, 'DapBreakpointCondition',
            { fg = '#935FA7', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
        end
      })

      -- executing the settings explicitly for the first time
      vim.api.nvim_exec_autocmds("ColorScheme", { group = "dap_colors" })

      vim.fn.sign_define('DapBreakpoint',
        { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition',
        { text = '', texthl = 'DapBreakpointCondition', numhl = 'DapBreakpointCondition' })
      vim.fn.sign_define('DapBreakpointRejected',
        { text = '', texthl = 'DapBreakpointRejected', numhl = 'DapBreakpointRejected' })
      vim.fn.sign_define('DapLogPoint', {
        text = '',
        texthl = 'DapLogPoint',
        numhl =
        'DapLogPoint'
      })
      vim.fn.sign_define('DapStopped',
        { text = ' ', texthl = 'DapStopped', numhl = 'DapStopped' })

      --- Setup of the debug adapters and their configs ---
      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        -- NOTE: Might need to be absolute path (use stdpath or something to
        -- get the mason location and be relative from there)
        command = 'OpenDebugAD7'
        -- On windows maybe (should be possible to define as function):
        -- options = {
        --   detached = false
        -- }
      }

      -- codelldb
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",

        -- On windows you may have to uncomment this:
        -- detached = false,
      }

      dap.configurations.cpp = {
        {
          name = 'Launch file (cppdbg)',
          type = 'cppdbg',
          request = 'launch',
          program = '${command:pickFile}',
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'enable pretty printing',
              ignoreFailures = false
            },
          },
        },
        {
          name = 'Attach to gdbserver :1234 (cppdbg)',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = 'gdb', -- TODO: Does this need to be full path?
          cwd = '${workspaceFolder}',
          program = '${command:pickFile}',
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'enable pretty printing',
              ignoreFailures = false
            },
          },
        },
        {
          name = 'Launch (codelldb)',
          type = 'codelldb',
          request = 'launch',
          program = '${command:pickFile}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
        {
          -- If you get an "Operation not permitted" error using this, try disabling YAMA:
          --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          name = "Attach to process (codelldb)",
          type = 'codelldb',
          request = 'attach',
          pid = require('dap.utils').pick_process,
          args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- Cortex debug
      dap.adapters.cortex_debug = {
        type = 'executable',

      }

      -- TODO: Rust setup (see for example https://github.com/theHamsta/nvim-dap-virtual-text/issues/14#issuecomment-887973061)
      -- https://github.com/miroshQa/dotfiles/blob/2cb9dc3368b1ac0982f26af724db8eac073ba55c/nvim/lua/languages/rust.lua
    end,
    keys = {
      { '<F5>',       function() require('dap').continue() end,          desc = 'Continue' },
      { '<leader>dr', function() require('dap').continue() end,          desc = 'Continue (r)un' },
      { '<F10>',      function() require('dap').step_over() end,         desc = 'Step over' },
      { '<F11>',      function() require('dap').step_into() end,         desc = 'Step into' },
      { '<F12>',      function() require('dap').step_out() end,          desc = 'Step out' },
      { '<leader>do', function() require('dap').step_out() end,          desc = 'Step (o)ut' },
      { '<F9>',       function() require('dap').toggle_breakpoint() end, desc = 'Toggle (b)reakpoint' },
      { '<Leader>b',  function() require('dap').toggle_breakpoint() end, desc = 'Toggle (b)reakpoint' },
      { '<Leader>B',  function() require('dap').set_breakpoint() end,    desc = 'Set (B)reakpoint' },
      {
        '<Leader>dC',
        function()
          local condition = vim.fn.input('Breakpoint condition: ')
          require('dap').set_breakpoint(condition, nil, nil)
        end,
        desc = '(C)onditional breakpoint'
      },
      { '<Leader>dx', function() require('dap').terminate() end,          desc = 'terminate' },
      {
        '<Leader>dl',
        function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        desc = '(l)og point message'
      },
      { '<Leader>dR', function() require('dap').repl.open() end,          desc = '(r)epl' },
      { '<Leader>dL', function() require('dap').run_last() end,           desc = 'run (l)ast' },
      { '<Leader>dc', function() require('dap').run_to_cursor() end,      desc = 'run to (c)ursor', mode = { 'n', 'v' } },
      { '<Leader>dh', function() require('dap.ui.widgets').hover() end,   desc = '(h)over',         mode = { 'n', 'v' } },
      { '<Leader>dp', function() require('dap.ui.widgets').preview() end, desc = '(p)review',       mode = { 'n', 'v' } },
      {
        '<Leader>df',
        function()
          local widgets = require('dap.ui.widgets')
          widgets.centered_float(widgets.frames)
        end,
        desc = '(d)ebug (f)rames'
      },
      {
        '<Leader>ds',
        function()
          local widgets = require('dap.ui.widgets')
          widgets.centered_float(widgets.scopes)
        end,
        desc = '(d)ebug (s)copes'
      },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    lazy = true,
    init = function()
      vim.api.nvim_create_user_command('DapUIOpen', function() require('dapui').open() end, { desc = 'Open dap ui' })
      vim.api.nvim_create_user_command('DapUIClose', function() require('dapui').close() end, { desc = 'Close dap ui' })
      vim.api.nvim_create_user_command('DapUIToggle', function() require('dapui').toggle() end,
        { desc = 'Toggle dap ui' })
    end,
    opts = {
      -- TODO: Fix this. Maybe dap-disasm is not made for use with both dap-view and dap-ui
      -- layouts = {
      --   {
      --     elements = { { id = "disassembly" } },
      --     position = "bottom",
      --     size = 0.15,
      --   },
      -- }
    },
    config = function(_, opts)
      -- local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup(opts)
      -- Running dap-disasm setup after setting up dap-ui, as the registering of dap-disasm requires dap-ui to be loaded
      require('dap-disasm').setup()

      -- -- Autostart dapui
      -- dap.listeners.before.attach.dapui_config = function()
      --   dapui.open()
      -- end
      -- dap.listeners.before.launch.dapui_config = function()
      --   dapui.open()
      -- end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
    end,
    keys = {
      { '<leader>du', function() require('dapui').toggle() end, desc = 'Toggle dap-(u)i' }
    }
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    lazy = true,
    opts = {
      -- all_references = true,
    },
    keys = {
      { '<leader>dv', function() require('nvim-dap-virtual-text').refresh() end, desc = '(v)irtual text' },
      { '<leader>dV', function() require('nvim-dap-virtual-text').toggle() end,  desc = '(V)irtual text toggle' },
    },
  },
  {
    'igorlfs/nvim-dap-view',
    cmd = { 'DapViewOpen', 'DapViewWatch', 'DapViewToggle', 'DapViewShow', 'DapViewJump' },
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      winbar = {
        sections = { 'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'repl', 'disassembly', },
      }
    },
    config = function(_, opts)
      require('dap-view').setup(opts)
      -- Running dap-disasm setup after setting up dap-view, as the registering of dap-disasm requires dap-view to be loaded
      require('dap-disasm').setup()
    end,
    keys = {
      { '<leader>dU', '<cmd>DapViewToggle<Cr>', desc = 'Toggle dap-view-(U)I' }
    }
  },
  {
    'Jorenar/nvim-dap-disasm',
    opts = {},
    keys = {
      { '<leader>dd', '<cmd>DapDisasm<Cr>', desc = 'Show (d)isassembly' }
    }
  },
  {
    'miroshQa/debugmaster.nvim',
    -- osv is needed if you want to debug neovim lua code. Also can be used
    -- as a way to quickly test-drive the plugin without configuring debug adapters
    dependencies = { 'mfussenegger/nvim-dap', 'jbyuki/one-small-step-for-vimkind' },
    opts = {
    },
    config = function()
      local dm = require('debugmaster')
      dm.plugins.osv_integration.enabled = true
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    end,
    keys = {
      { '<leader>dm', function() require('debugmaster').mode.toggle() end, nowait = true, desc = 'debug(m)aster', mode = { 'n', 'v' }, },
    }
  },
}
