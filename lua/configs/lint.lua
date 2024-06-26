local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },
  vue = { "eslint_d" },
  markdown = { "markdownlint" },
  lua = { "selene" },
  luau = { "selene" },
  java = { "checkstyle" },
  kotlin = { "ktlint" },
  dockerfile = { "hadolint" },
  groovy = { "npm-groovy-lint" },
  gradle = { "npm-groovy-lint" },
}

lint.linters.eslint_d.args = {
  "--no-warn-ignored", -- <-- this is the key argument
  "--format",
  "json",
  "--stdin",
  "--stdin-filename",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- Global linters
local globalLinters = {
  "codespell",
  "proselint",
}
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint(globalLinters)
  end,
})
