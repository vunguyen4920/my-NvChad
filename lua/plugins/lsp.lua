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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- defaults
        "lua-language-server",
        "stylua",

        -- web-dev
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "vue-language-server",
        "lemminx",
        "yaml-language-server",
        "json-lsp",

        -- db
        "prisma-language-server",
        "graphql-language-service-cli",

        -- documentation
        "marksman",

        -- general purpose
        "typescript-language-server",

        -- devops
        "dockerfile-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
}

return plugins
