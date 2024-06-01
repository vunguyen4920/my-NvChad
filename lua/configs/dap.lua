local dap = require "dap"
local ui = require "dapui"
local mason_registry = require "mason-registry"

-- ui
-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })

ui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right",
    },
    {
      elements = {
        "repl",
        "breakpoints",
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
}

-- JavaScript
local js_debug_adapter_path = mason_registry.get_package("js-debug-adapter"):get_install_path()
  .. "/js-debug/src/dapDebugServer.js"
local firefox_debug_adapter_path = mason_registry.get_package("firefox-debug-adapter"):get_install_path()
  .. "/dist/adapter.bundle.js"

dap.adapters = {
  ["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { js_debug_adapter_path, "${port}" },
    },
  },
  firefox = {
    type = "executable",
    command = "node",
    args = { firefox_debug_adapter_path },
  },
}

dap.configurations = {
  javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  },
  typescript = {
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
  },
}
