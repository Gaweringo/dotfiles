return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    cmd = 'RenderMarkdown',
    opts = {
      completions = { lsp = { enabled = true }, blink = { enabled = true } },
      code = { border = 'thick' },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim', 'saghen/blink.cmp' },
    keys = {
      { '<localleader>r', '<Cmd>RenderMarkdown buf_toggle<Cr>', desc = "Toggle [r]ender-markdown", ft = 'markdown' },
    },
  },

  -- install without yarn or npm
  {
    'gaweringo/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    keys = {
      { '<localleader>p', '<Cmd>MarkdownPreviewToggle<Cr>', desc = "Toggle Markdown[p]review", ft = 'markdown' },
    },
    build = function()
      require('lazy').load { plugins = { 'markdown-preview.nvim' } }
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_browser = 'chromium'
      if vim.fn.has('win32') == 1 and vim.fn.has('wsl') == 0 then
        vim.cmd [[
          function! OpenMarkdownPreview (url)
            execute "silent !start chromium --app=" . a:url
          endfunction
          let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]]
      else
        vim.cmd [[
          function! OpenMarkdownPreview (url)
            execute "silent !chromium --app=" . a:url . " &"
          endfunction
          let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]]
      end
    end,
  },
}
