local options = {
  formatters_by_ft = {
    css = { { "prettierd", "prettier" }, "eslint_d" },
    graphql = { { "prettierd", "prettier" }, "eslint_d" },
    html = { { "prettierd", "prettier" }, "eslint_d" },
    javascript = { { "prettierd", "prettier" }, "eslint_d" },
    javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
    json = { { "prettierd", "prettier" }, "eslint_d" },
    markdown = { { "prettierd", "prettier" }, "eslint_d" },
    svelte = { { "prettierd", "prettier" }, "eslint_d" },
    typescript = { { "prettierd", "prettier" }, "eslint_d" },
    typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
    vue = { { "prettierd", "prettier" }, "eslint_d" },
    xml = { { "prettierd", "prettier" }, "eslint_d" },
    yaml = { { "prettierd", "prettier" }, "eslint_d" },
    lua = { "stylua" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 12000,
    async = false,
    lsp_fallback = true,
  },
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

require("conform").setup(options)
require("conform").formatters.eslint_d = {
  prepend_args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "$FILENAME", "--cache" },
}
