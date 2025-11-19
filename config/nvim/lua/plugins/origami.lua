-- lazy.nvim
return {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = { foldKeymaps = { setup = true } },
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}
