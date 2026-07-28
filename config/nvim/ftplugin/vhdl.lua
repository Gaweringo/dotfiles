vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.b.disable_autoformat = true
vim.bo.comments = ':--'
vim.opt_local.formatoptions:append('r')

vim.keymap.set('n', '<localleader>r', function()
    Snacks.picker.pick({
        title = "VUnit run targets",
        format = "text",
        finder = function(opts, ctx)
            local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
            local file = vim.api.nvim_buf_get_name(0)
            local runs = {} ---@type snacks.picker.finder.Item[]
            for i, line in ipairs(buf_lines) do
                local start, _, match = string.find(line, [[run%("(.+)"%)]])
                if match then
                    table.insert(runs, {
                        -- label = Snacks.picker.util.align("label", #tostring(#runs), { align = "right" }),
                        label = match,
                        line = i,
                        text = match,
                        file = file,
                        pos = { i, start - 1 },
                    })
                end
            end
            return runs
        end,
    })
end, { desc = "VUnit run targets"})
