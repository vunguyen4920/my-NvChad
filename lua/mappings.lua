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

-- Formatter
map("n", "<leader>fme", ":FormatEnable<CR>")
map("n", "<leader>fmd", ":FormatDisable<CR>")
