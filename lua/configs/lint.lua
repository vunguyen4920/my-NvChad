local lint = require "lint"

lint.linters_by_ft = {
  markdown = { "markdownlint" },
  lua = { "selene" },
  luau = { "selene" },
  java = { "checkstyle" },
  kotlin = { "ktlint" },
}

-- Global linters
local globalLinters = {}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
    lint.try_lint(globalLinters)
  end,
})
