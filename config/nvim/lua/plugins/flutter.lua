local fts = { 'dart', 'flutterToolsOutline' }

return {
  {
    'nvim-flutter/flutter-tools.nvim',
    ft = 'dart',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<localleader>o', '<cmd>FlutterOutlineToggle<cr>', desc = 'Toggle widget outline', ft = fts },
        { '<localleader>d', '<cmd>FlutterDebug<cr>', desc = 'Debug', ft = fts },
        { '<localleader>D', '<cmd>FlutterDevices<cr>', desc = 'Devices', ft = fts },
    },
    opts = {
      widget_guides = {
        enabled = true,
      },
    }
  },
  {
    'akinsho/pubspec-assist.nvim',
    dependencies = { 'plenary.nvim' },
    event = 'BufEnter pubspec.yaml',
    init = function(_)
      vim.api.nvim_create_autocmd({'BufEnter', 'BufCreate'}, {
        pattern = 'pubspec.yaml',
        callback = function(ev)
          vim.keymap.set('n', '<localleader>a', '<cmd>PubspecAssistAddPackage<cr>', { desc = 'add package', buf = ev.buf })
          vim.keymap.set('n', '<localleader>A', '<cmd>PubspecAssistAddDevPackage<cr>',{ desc = 'Add dev package', buf = ev.buf })
          vim.keymap.set('n', '<localleader>v', '<cmd>PubspecAssistPickVersion<cr>', { desc = 'pick version', buf = ev.buf })
        end,
      })
    end,
    config = true,
  }
}
