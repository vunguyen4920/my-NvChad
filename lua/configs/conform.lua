local options = {
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
    yaml = { "prettier", "prettier" },
    lua = { "stylua" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    groovy = { "npm-groovy-lint" },
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return {
      timeout_ms = 5000,
      async = false,
      lsp_fallback = true,
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

require("conform").setup(options)
require("conform").formatters.eslint_d = {
  prepend_args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "$FILENAME", "--cache" },
}
