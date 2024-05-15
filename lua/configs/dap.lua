-- TODO: Test the debug plugins
local dap = require "dap"
local mason_registry = require "mason-registry"

-- JavaScript
local js_debug_adapter_path = mason_registry.get_package("js-debug-adapter"):get_install_path()
  .. "/js-debug/src/dapDebugServer.js"
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { js_debug_adapter_path, "${port}" },
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

-- Firefox
local firefox_debug_adapter_path = mason_registry.get_package("firefox-debug-adapter"):get_install_path()
  .. "/dist/adapter.bundle.js"

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = { firefox_debug_adapter_path },
}

dap.configurations.typescript = {
  {
    name = "Debug with Firefox",
    type = "firefox",
    request = "launch",
    reAttach = true,
    webRoot = "${workspaceFolder}",
    firefoxExecutable = "/usr/bin/firefox",
    host = "localhost",
    port = "${port}",
  },
}
