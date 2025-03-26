local plugins = {
  {
    "Exafunction/codeium.vim",
    cmd = "Codeium",
    event = "BufEnter",
    build = ":Codeium Auth",
    keys = {
      {
        mode = { "i" },
        "<A-;>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        expr = true,
        silent = true,
        desc = "AI Codeium Accept",
      },
      {
        mode = { "n" },
        "<leader>ai",
        function()
          return vim.fn["codeium#Chat"]()
        end,
        expr = true,
        silent = true,
        desc = "AI Chat",
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "InsertEnter",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- for example
      provider = "copilot",
      auto_suggestions_provider = "copilot",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup {}
        end,
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

return plugins
