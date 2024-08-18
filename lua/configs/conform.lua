local options = {
  -- log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    css = { "prettier" },
    scss = { "prettier" },
    sass = { "prettier" },
    graphql = { "prettier", "eslint_d" },
    html = { "prettier", "eslint_d" },
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "markdownlint" },
    svelte = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    vue = { "prettier", "eslint_d" },
    xml = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    groovy = { "npm-groovy-lint" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return {
      timeout_ms = 1500,
      lsp_format = "fallback",
    }
  end,
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

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

require("conform").setup(options)
