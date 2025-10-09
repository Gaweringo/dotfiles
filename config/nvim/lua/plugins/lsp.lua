vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, { desc = "LSP Hover", buffer = true })
		vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
		vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, { desc = "LSP Rename" })
		-- Client / Language specific
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buf = ev.buf
		if client ~= nil and client.name == 'clangd' then
			vim.keymap.set({ 'n' }, '<localleader>o', '<cmd>LspClangdSwitchSourceHeader<CR>',
				{ desc = 'Clangd switch source/header', buffer = buf })
		end
	end,
})

-- Extra settings for clangd (are merged with the settings from lspconfig)
vim.lsp.config('clangd', {
	-- see $clangd -h, https://clangd.llvm.org/installation
	cmd = {
		'clangd',
		'-j=6', -- Number of async background workers
		'--background-index',
		"--header-insertion=never",    -- Never insert #include with completion
		'--all-scopes-completion',     -- Include completion items from namespaces, not visible in scope (automatic insertion)
		'--clang-tidy',                -- Run and show clang-tidy recommendations
		-- "--completion-style=detailed", -- Sementically distinct completion show (overloads are not grouped in one item)
		'--fallback-style=Google',     -- Style to apply when no .clang-format is found (Maybe also LLVM)
		'--header-insertion-decorators', -- Circular dot indicator shows that a header will be inserted with completion
		'--rename-file-limit=0',       -- Limit the number of files to be affected by symbol renaming. 0 means no limit (default=50)
		'--pch-storage=memory',        -- May improve performance as tradeoff for memory usage
	}
})

-- Typst
vim.lsp.config('tinymist', {
	settings = {
		exportPdf = "onSave",
	},
})

-- All the setup regarding lsps
return {
	{
		-- Translates from lspconfig names to mason names, and automatically enables LSPs installed with mason
		-- And adds :LspInstall and :LspUninstall commands
		'mason-org/mason-lspconfig.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		-- Some commands are actually from nvim-lspconfig, but it's a dependency so will be loaded by mason-lspconfig
		init = function ()
			vim.api.nvim_create_user_command('LspLogClear', function ()
				vim.fs.rm(vim.lsp.get_log_path())
			end, { desc = "Clear LSP log file" })
		end,
		cmd = { 'LspInfo', 'LspStart', 'LspInstall', 'LspUninstall' },
		dependencies = { { 'mason-org/mason.nvim', opts = {}, cmd = 'Mason' }, 'neovim/nvim-lspconfig' },
		opts = {
			-- LSPs we want to be installed automatically (basically the base LSPs) when using this config on a new machine
			ensure_installed = {
				'lua_ls',
				'clangd',
				'rust_analyzer',
				'vhdl_ls',
				'tinymist',
				'jsonls',
			}
		}
	},
	-- Shows LSP messages in the bottom right to see what the LSP is doing on startup
	{ 'j-hui/fidget.nvim', opts = {}, event = 'LspAttach' },
	{
		-- To tell lua_ls about the neovim api
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = { "nvim-dap-ui" },
		}
	},
	{
		-- Show inlay hints at the end of the line, not inline
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = { autoEnableHints = true, label = { truncateAtChars = 30 } },
		keys = {
			{ '<leader>tH', function() require('lsp-endhints').toggle() end, desc = 'Endhints' },
		},
	},
}
