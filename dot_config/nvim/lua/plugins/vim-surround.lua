return {
  {
    "kylechui/nvim-surround",
    name = "nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
}
