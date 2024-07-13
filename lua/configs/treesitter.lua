local options = {
  ensure_installed = {
    -- defaults
    "vimdoc",
    "vim",
    "lua",

    -- web-dev
    "html",
    "css",
    "scss",
    "tsx",
    "vue",
    "svelte",
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
    "java",
    "kotlin",

    -- devops
    "dockerfile",
    "groovy",

    -- git
    "gitattributes",
    "gitcommit",
    "gitignore",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

return options
