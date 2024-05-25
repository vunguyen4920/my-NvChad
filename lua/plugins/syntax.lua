local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufReadPre",
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
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
          spacing = 5,
          severity = { min = vim.diagnostic.severity.WARN },
        },
        update_in_insert = true,
      })
    end,
    event = "BufReadPre",
  },
  {
    "andersevenrud/nvim_context_vt",
    opts = {},
    config = function()
      require("nvim_context_vt").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {},
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    event = "BufReadPre",
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

  {
    "numToStr/Comment.nvim",
    config = function()
      local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup {
        padding = true,
        sticky = true,
        ignore = "^$",
        pre_hook = prehook,
        post_hook = nil,
      }
    end,
    event = "BufReadPre",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}

return plugins
