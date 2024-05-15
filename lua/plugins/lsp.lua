-- TODO: test markdown formatter
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
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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

        -- documentation
        "remark-cli",

        -- web-dev
        "prettier",
        "prettierd",
      },
    },
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
    "mfussenegger/nvim-dap",
    opts = {},
    config = function()
      require "configs.dap"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- defaults

        -- web-dev
        "chrome",
        "firefox",

        -- general
        "js",
      },
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("telescope").load_extension "dap"
    end,
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
