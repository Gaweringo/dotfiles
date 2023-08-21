return {
  {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
      require("crates").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
    opts = {
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- {
  --   "nvim-lua/plenary.nvim",
  --   "mfussenegger/nvim-dap",
  -- },
}
