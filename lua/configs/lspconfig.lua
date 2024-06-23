-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "astro",
  "css_variables",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "emmet_ls",
  "eslint",
  "graphql",
  "html",
  "jsonls",
  "kotlin_language_server",
  "lemminx",
  "lua_ls",
  "marksman",
  "prismals",
  "somesass_ls",
  "svelte",
  "tailwindcss",
  "taplo",
  "volar",
  "vtsls",
  "yamlls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_init = on_init,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      codeLens = {
        enable = true,
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
}

lspconfig.eslint.setup {
  on_init = on_init,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    workingDirectories = { mode = "auto" },
  },
}

local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}

local function ts_organize_imports()
  local params = {
    command = "typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

-- typescript
lspconfig.vtsls.setup {
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)

    vim.keymap.set("n", "<A-o>", ts_organize_imports, { buffer = bufnr })
  end,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    vtsls = {
      complete_function_calls = true,
      autoUseWorkspaceTsdk = true,
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
          {
            name = "typescript-svelte-plugin",
            enabled = true,
            languages = { "svelte" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
            assumeIsSvelteProject = false,
          },
        },
      },
    },
    javascript = {
      suggest = {
        completeFunctionCalls = true,
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
  },
  commands = {
    OrganizeImports = {
      function()
        ts_organize_imports()
      end,
      description = "Organize Imports",
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
}

-- json
lspconfig.jsonls.setup {
  on_init = on_init,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

-- yaml
lspconfig.yamlls.setup {
  on_init = on_init,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
