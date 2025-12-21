-- lazy.nvim
return {
    'chrisgrieser/nvim-origami',
    event = 'VeryLazy',
    opts = {
        foldKeymaps = { setup = false },
        autoFold = {
            enabled = true,
            kinds = { 'imports' }, ---@type lsp.FoldingRangeKind[]
        },

    },
    init = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,
}
