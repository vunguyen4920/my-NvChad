local plugins = {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    opts = {},
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "VeryLazy",
    config = function()
      require("session_manager").setup {}
    end,
  },
}

return plugins
