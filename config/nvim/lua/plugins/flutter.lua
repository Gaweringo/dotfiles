local fts = { 'dart', 'flutterToolsOutline' }

return {
    'nvim-flutter/flutter-tools.nvim',
    ft = 'dart',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<localleader>o', '<cmd>FlutterOutlineToggle<cr>', desc = 'Toggle widget outline', ft = fts },
        { '<localleader>d', '<cmd>FlutterDebug<cr>', desc = 'Debug', ft = fts },
        { '<localleader>D', '<cmd>FlutterDevices<cr>', desc = 'Devices', ft = fts },
    },
    config = true,
}
