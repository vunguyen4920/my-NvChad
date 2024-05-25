local plugins = {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
    config = function()
      require "configs.colorizer"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
  {
    "folke/twilight.nvim",
    opts = {},
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
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    config = function()
      require("neoscroll").setup {
        easing_function = "sine",
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = function()
      return require "configs.fidget"
    end,
  },
}

return plugins
