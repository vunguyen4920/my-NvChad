require "nvchad.mappings"

--[[ Disable default mappings ]]
local nomap = vim.keymap.del
nomap("i", "<C-b>")
nomap("n", "<C-h>")
nomap("n", "<C-l>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-s>")
nomap("n", "<leader>h")

-- add yours here

local map = vim.keymap.set

map("n", "<leader>me", "<cmd>set mouse=a<CR>", { desc = "Mouse Enable" })
map("n", "<leader>md", "<cmd>set mouse=<CR>", { desc = "Mouse Disable" })
map("i", "jk", "<ESC>", { desc = "<ESC> Escape Insert mode" })
map("i", "jj", "<ESC>", { desc = "<ESC> Escape Insert mode" })

-- git
map("n", "<leader>gg", function()
  require("neogit").open()
end, { desc = "Git Neogit Open" })

map("n", "<leader>ggs", function()
  require("neogit").open { kind = "split" }
end, { desc = "Git Neogit Open in split" })

-- Formatter
map("n", "<leader>fme", ":FormatEnable<CR>")
map("n", "<leader>fmd", ":FormatDisable<CR>")

-- TODO:
-- WARN:
-- FIX:
-- HACK:
-- PERF:
-- NOTE:
-- TEST:
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Todo Jump next" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Todo Jump previous" })

map("n", "<leader>tot", "<cmd>TodoTelescope keywords=TODO<CR>", { desc = "[To]do Telescope [T]odo" })
map("n", "<leader>ton", "<cmd>TodoTelescope keywords=NOTE<CR>", { desc = "[To]do Telescope [N]ote" })

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Preview Markdown" })

-- DAP
local dap = require "dap"
local dapui = require "dapui"
map("n", "<leader>ds", function()
  dap.continue()
  dapui.toggle {}
end, { desc = "DAP Start" })
map("n", "<leader>dc", function()
  dap.continue()
end, { desc = "DAP Continue" })

map("n", "<leader>do", function()
  dap.step_over()
end, { desc = "DAP Step Over" })

map("n", "<leader>di", function()
  dap.step_into()
end, { desc = "DAP Step Into" })

map("n", "<leader>du", function()
  dap.step_out()
end, { desc = "DAP Step Out" })

map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DAP Toggle Debug breakpoint" })

map("n", "<leader>dB", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "DAP Set Debug breakpoint with message" })

map("n", "<leader>de", function()
  dap.clear_breakpoints()
  dapui.toggle {}
  dap.terminate()
end, { desc = "DAP end" })

-- Spectre
local spectre = require "spectre"
map("n", "<leader>S", function()
  spectre.toggle()
end, { desc = "Spectre Toggle" })
map("n", "<leader>sw", function()
  spectre.open_visual { select_word = true }
end, { desc = "Search current word" })
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
map(
  "n",
  "<leader>sp",
  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
  { desc = "Search on current file" }
)

-- Chainsaw
local chainsaw = require "chainsaw"
map("n", "<leader>cv", function()
  chainsaw.variableLog()
end, { desc = "Chainsaw Variable Log" })
map("n", "<leader>co", function()
  chainsaw.objectLog()
end, { desc = "Chainsaw Object Log" })
map("n", "<leader>cas", function()
  chainsaw.assertLog()
end, { desc = "Chainsaw Assert Log" })
map("n", "<leader>cme", function()
  chainsaw.messageLog()
end, { desc = "Chainsaw Message Log" })
map("n", "<leader>cst", function()
  chainsaw.stacktraceLog()
end, { desc = "Chainsaw Stacktrace Log" })
map("n", "<leader>cb", function()
  chainsaw.beepLog()
end, { desc = "Chainsaw Beep Log" })
map("n", "<leader>ct", function()
  chainsaw.timeLog()
end, { desc = "Chainsaw Time Log" })
map("n", "<leader>cd", function()
  chainsaw.debugLog()
end, { desc = "Chainsaw Debug Log" })
map("n", "<leader>cr", function()
  chainsaw.removeLogs()
end, { desc = "Chainsaw Remove Logs" })

-- Treesitter context
map("n", "<leader>tc", "<cmd>TSContextToggle<CR>", { desc = "Treesitter Context Toggle" })

-- Workspaces
map("n", "<leader>p", function()
  vim.cmd "Telescope projections"
end, { desc = "Projects Telescope" })
map("n", "<leader>pa", function()
  vim.cmd "AddWorkspace"
end, { desc = "Projects Add Workspace" })
map("n", "<leader>ss", function()
  vim.cmd "StoreProjectSession"
end, { desc = "Projects Store Session" })
map("n", "<leader>sr", function()
  vim.cmd "RestoreProjectSession"
end, { desc = "Projects Restore Session" })

-- NPM Package Info
-- Show dependency versions
map(
  { "n" },
  "<leader>pks",
  "<cmd>lua require('package-info').show({ force = true })<cr>",
  { silent = true, noremap = true }
)
-- Hide dependency versions
map({ "n" }, "<leader>pkh", require("package-info").hide, { silent = true, noremap = true })
-- Toggle dependency versions
map({ "n" }, "<leader>pkt", require("package-info").toggle, { silent = true, noremap = true })
-- Update dependency on the line
map({ "n" }, "<leader>pku", require("package-info").update, { silent = true, noremap = true })
-- Delete dependency on the line
map({ "n" }, "<leader>pkd", require("package-info").delete, { silent = true, noremap = true })
-- Install a new dependency
map({ "n" }, "<leader>pki", require("package-info").install, { silent = true, noremap = true })
-- Install a different dependency version
map({ "n" }, "<leader>pkp", require("package-info").change_version, { silent = true, noremap = true })
