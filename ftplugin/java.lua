-- TODO: test dap servers
-- TODO: lombok bug
local java_cmds = vim.api.nvim_create_augroup("java_cmds", { clear = true })
local mason_registry = require "mason-registry"

-- use this function notation to build some variables
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local jdtls_root_dir = vim.fs.root(0, root_markers)

-- calculate workspace dir
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir -p " .. workspace_dir)

-- get the current OS
local os
if vim.fn.has "macunix" then
  os = "mac"
elseif vim.fn.has "win32" then
  os = "win"
else
  os = "linux"
end

local jdtls_install_path = mason_registry.get_package("jdtls"):get_install_path()

local bundles = {}

---
-- Include java-test bundle if present
---
local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()

local java_test_bundle = vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n")

if java_test_bundle[1] ~= "" then
  vim.list_extend(bundles, java_test_bundle)
end

---
-- Include java-debug-adapter bundle if present
---
local java_debug_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

local java_debug_bundle =
  vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")

if java_debug_bundle[1] ~= "" then
  vim.list_extend(bundles, java_debug_bundle)
end

local function enable_codelens(bufnr)
  pcall(vim.lsp.codelens.refresh)

  vim.api.nvim_create_autocmd("BufWritePost", {
    buffer = bufnr,
    group = java_cmds,
    desc = "refresh codelens",
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  })
end

local function enable_debugger(_)
  require("jdtls").setup_dap { hotcodereplace = "auto" }
  require("jdtls.dap").setup_dap_main_class_configs()
end

local features = {
  -- change this to `true` to enable codelens
  codelens = true,

  -- change this to `true` if you have `nvim-dap`,
  -- `java-test` and `java-debug-adapter` installed
  debugger = true,
}

local function jdtls_on_attach(_, bufnr)
  if features.debugger then
    enable_debugger(bufnr)
  end

  if features.codelens then
    enable_codelens(bufnr)
  end

  -- The following mappings are based on the suggested usage of nvim-jdtls
  -- https://github.com/mfussenegger/nvim-jdtls#usage

  local opts = { buffer = bufnr }
  vim.keymap.set("n", "<A-o>", "<cmd>lua require('jdtls').organize_imports()<cr>", opts)
  vim.keymap.set("n", "crv", "<cmd>lua require('jdtls').extract_variable()<cr>", opts)
  vim.keymap.set("x", "crv", "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", opts)
  vim.keymap.set("n", "crc", "<cmd>lua require('jdtls').extract_constant()<cr>", opts)
  vim.keymap.set("x", "crc", "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", opts)
  vim.keymap.set("x", "crm", "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", opts)
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  on_attach = jdtls_on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. jdtls_install_path .. "/lombok.jar",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(jdtls_install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    jdtls_install_path .. "/config_" .. os,
    "-data",
    workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = jdtls_root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
    },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
