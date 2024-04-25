require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Harpoon
local harpoon = require "harpoon"
map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add buffer to Harpoon" })

map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu" })

map("n", "<C-z>", function()
  harpoon:list():prev()
end, { desc = "Harpoon cycle backward buffer" })

map("n", "<C-x>", function()
  harpoon:list():next()
end, { desc = "Harpoon cycle forward buffer" })

-- Trouble.nvim
map("n", "<leader>tr", function()
  require("trouble").toggle()
end, { desc = "Toggle trouble" })

map("n", "<leader>trw", function()
  require("trouble").toggle "workspace_diagnostics"
end, { desc = "Toggle trouble workspace" })

map("n", "<leader>trd", function()
  require("trouble").toggle "document_diagnostics"
end, { desc = "Toggle trouble document" })

map("n", "<leader>trq", function()
  require("trouble").toggle "quickfix"
end, { desc = "Toggle trouble quickfix" })

map("n", "<leader>trl", function()
  require("trouble").toggle "loclist"
end, { desc = "Toggle trouble loclist" })

-- git
map("n", "<leader>gg", function()
  require("neogit").open()
end, { desc = "Open Neogit" })

map("n", "<leader>ggs", function()
  require("neogit").open { kind = "split" }
end, { desc = "Open Neogit in split" })

map("n", "<leader>gc", function()
  require("neogit").open { "commit" }
end, { desc = "Open Neogit commit popup" })
