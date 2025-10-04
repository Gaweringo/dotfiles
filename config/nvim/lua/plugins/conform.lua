return {
  -- Formatting
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>F',
      function()
        require('conform').format { async = true }
      end,
      mode = '',
      desc = '[F]ormat',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    -- TODO: Maybe use mason-tool-installer to make the installation of the formatting tools declerative
    formatters_by_ft = {
      -- vhdl = { 'hdl_emacs' },
      vhdl = { 'vsg' },
      json = { 'jq' },
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      python = { 'YAPF' },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    notify_on_error = false,
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      -- Toggle keybind is in ./snacks.lua
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      -- TODO: Disable autoformat for files in a certain path
      -- local bufname = vim.api.nvim_buf_get_name(bufnr)
      -- if bufname:match("/node_modules/") then
      --   return
      -- end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    -- Customize formatters
    formatters = {
      hdl_emacs = {
        command = 'emacs',
        args = {
          '$FILENAME',
          '--batch',
          '--eval',
          -- Taken from https://github.com/InES-HPMM/emacs-vhdl-formatter-vscode/blob/c811eccd75b95cff9d6fa5144e04c7a92f1de17a/src/extension.ts#L8
          '(let (vhdl-file-content next-line) (while (setq next-line (ignore-errors (read-from-minibuffer ""))) (setq vhdl-file-content (concat vhdl-file-content next-line "\\n"))) (with-temp-buffer (vhdl-mode) (setq vhdl-basic-offset 3) (insert vhdl-file-content) (vhdl-beautify-region (point-min) (point-max)) (princ (buffer-string))))',
        },
        stdin = true,
      },
    },
  },
  init = function()
    local ensure_installed = {
      'stylua',
      'vhdl-style-guide',
      'clang-format',
      'yapf',
    }
    local registry = require 'mason-registry'
    for _, package_name in ipairs(ensure_installed) do
      if registry.has_package(package_name) and not registry.is_installed(package_name) then
        vim.print('Installing: ' .. package_name)
        registry.get_package(package_name):install()
      end
    end
    -- If you want the formatexpr (gq operator), here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
