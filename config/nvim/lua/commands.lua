vim.api.nvim_create_user_command('BashRunLine', [[.w !bash<Cr>]], { desc = "Run in bash" })

