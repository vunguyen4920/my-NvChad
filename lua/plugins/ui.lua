local plugins = {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local presets = require "markview.presets"
      local markview = require "markview"

      markview.setup {
        markdown = {
          headings = presets.headings.slanted,
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = function()
      local todo_comments = require "todo-comments"

      return {
        {
          "]t",
          function()
            todo_comments.jump_next()
          end,
          desc = "Todo Jump next",
        },
        {
          "[t",
          function()
            todo_comments.jump_prev()
          end,
          desc = "Todo Jump previous",
        },
        {
          "<leader>ton",
          "<cmd>TodoTelescope keywords=NOTE<CR>",
          desc = "[To]do Telescope [N]ote",
        },
        {
          "<leader>tot",
          "<cmd>TodoTelescope keywords=TODO<CR>",
          desc = "[To]do Telescope [T]odo",
        },
      }
    end,
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
