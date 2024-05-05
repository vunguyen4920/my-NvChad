local plugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
    config = function()
      require("ts-error-translator").setup {}
    end,
  },
}

return plugins
