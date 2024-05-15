return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
    config = function()
      require("hardtime").setup {}
    end,
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
  {
    "alanfortlink/blackjack.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("blackjack").setup()
    end,
    lazy = true,
    event = "VeryLazy",
  },
}
