local plugins = {
  {
    -- Make sure to set this up properly if you have lazy=true
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "ui-select"
    end,
    event = "VeryLazy",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
    event = "LspAttach",
  },
  {
    "lewis6991/satellite.nvim",
    config = function()
      require("satellite").setup {}
    end,
    event = "BufEnter",
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    opts = {},
  },
}

return plugins
