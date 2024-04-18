require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local harpoon = require "harpoon"
map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<C-c>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-z>", function()
  harpoon:list():prev()
end)
map("n", "<C-x>", function()
  harpoon:list():next()
end)

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local harpoon = require "harpoon"
map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map("n", "<C-1>", function()
  harpoon:list():select(1)
end)
map("n", "<C-2>", function()
  harpoon:list():select(2)
end)
map("n", "<C-3>", function()
  harpoon:list():select(3)
end)
map("n", "<C-4>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-z>", function()
  harpoon:list():prev()
end)
map("n", "<C-x>", function()
  harpoon:list():next()
end)
