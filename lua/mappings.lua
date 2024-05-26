require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>me", "<cmd>set mouse=a<CR>", { desc = "Mouse Enable" })
map("n", "<leader>md", "<cmd>set mouse=<CR>", { desc = "Mouse Disable" })
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
end, { desc = "Todo Jump next" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Todo Jump previous" })

map("n", "<leader>tot", "<cmd>Telescope todo-comments todo<CR>", { desc = "Todo Telescope" })

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Preview Markdown" })

-- DAP
map("n", "<leader>ds", function()
  require("dap").continue()
  require("dapui").toggle {}
end, { desc = "DAP Start" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP Continue" })

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "DAP Step Over" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "DAP Step Into" })

map("n", "<leader>du", function()
  require("dap").step_out()
end, { desc = "DAP Step Out" })

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Debug breakpoint" })

map("n", "<leader>dB", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set Debug breakpoint with message" })

map("n", "<leader>de", function()
  require("dap").clear_breakpoints()
  require("dapui").toggle {}
  require("dap").terminate()
end, { desc = "DAP end" })

-- AI
map("i", "<A-;>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- APM
local apm = require "vim-apm"
map("n", "<leader>apm", function()
  apm:toggle_monitor()
end)

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "sf", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

map({ "n" }, "<leader>ss", "<cmd>SessionManager<CR>", { desc = "SessionManager Open" })
map(
  { "n" },
  "<leader>sslc",
  "<cmd>SessionManager load_current_dir_session<CR>",
  { desc = "SessionManager Open Current Dir Session" }
)

-- Games
map({ "n" }, "<leader>pgc", function()
  require("playtime").setup()
end, { desc = "Games Play Card Games" })
