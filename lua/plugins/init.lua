return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
}
