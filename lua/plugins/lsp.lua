-- These are some examples, uncomment them if you want to see them work!
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
    opts = {
      -- defaults
      "lua_ls",

      -- web-dev
      "html",
      "cssls",
      "eslint",
      "volar",
      "lemminx",
      "yamlls",
      "jsonls",

      -- db
      "prismals",
      "graphql",

      -- documentation
      "marksman",

      -- general purpose
      "tsserver",

      -- devops
      "dockerls",
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufWritePre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        vue = { "eslint_d" },
        lua = { "selene" },
        luau = { "selene" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {},
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- defaults
          "stylua",
          "selene",

          -- web-dev
          "prettier",
          "eslint_d",
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web-dev
        "html",
        "css",
        "scss",
        "tsx",
        "vue",
        "xml",
        "yaml",
        "json",
        "json5",
        "jsonc",

        -- db
        "prisma",
        "graphql",

        -- documentation
        "markdown",
        "mermaid",
        "jsdoc",
        "luadoc",

        -- general purpose
        "regex",
        "javascript",
        "typescript",

        -- devops
        "dockerfile",

        -- git
        "gitattributes",
        "gitcommit",
        "gitignore",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
    lazy = true,
    event = "VeryLazy",
  },
}

return plugins
