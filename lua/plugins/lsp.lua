-- These are some examples, uncomment them if you want to see them work!
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = {
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
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- defaults
        "stylua",

        -- web-dev
        "prettier",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- defaults
        "selene",

        -- web-dev
        "eslint_d",
      },
    },
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
