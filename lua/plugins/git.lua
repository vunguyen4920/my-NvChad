local plugins = {
  {
    "sindrets/diffview.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
}

return plugins
