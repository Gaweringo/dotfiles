return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    cmd = 'RenderMarkdown',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },

  -- install without yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      require('lazy').load { plugins = { 'markdown-preview.nvim' } }
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_browser = 'chromium'
    end,
  },
}
