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
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
