require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

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
require("gitsigns").setup {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
    map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
    map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

    -- Text object
    map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}

-- Linter
map("n", "<leader>ll", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- Zen
map("n", "<leader>z", function()
  require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })

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
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- BlackJack
map("n", "<leader>bj", ":BlackJackNewGame<CR>")
map("n", "<leader>bjr", ":BlackJackResetScores<CR>")
