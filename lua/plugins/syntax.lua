local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {}

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
          spacing = 5,
          severity = { min = vim.diagnostic.severity.WARN },
        },
        update_in_insert = true,
      })
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "andersevenrud/nvim_context_vt",
    opts = {},
    config = function()
      require("nvim_context_vt").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
    config = function()
      require("treesitter-context").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = "VeryLazy",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 3,
      }
    end,
  },
}

return plugins
