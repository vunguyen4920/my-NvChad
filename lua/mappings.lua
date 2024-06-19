require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>me", "<cmd>set mouse=a<CR>", { desc = "Mouse Enable" })
map("n", "<leader>md", "<cmd>set mouse=<CR>", { desc = "Mouse Disable" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "<ESC> Escape Insert mode" })
map("i", "jj", "<ESC>", { desc = "<ESC> Escape Insert mode" })

-- Harpoon
local harpoon = require "harpoon"
map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon Add buffer" })

map("n", "<C-a>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu" })

map("n", "<C-j>", function()
  harpoon:list():prev()
end, { desc = "Harpoon cycle backward buffer" })

map("n", "<C-k>", function()
  harpoon:list():next()
end, { desc = "Harpoon cycle forward buffer" })

-- Trouble.nvim
map("n", "<leader>tr", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Diagnostics Open" })
map(
  "n",
  "<leader>tR",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Trouble Diagnostics Current Buf Open" }
)

-- git
map("n", "<leader>gg", function()
  require("neogit").open()
end, { desc = "Git Neogit Open" })

map("n", "<leader>ggs", function()
  require("neogit").open { kind = "split" }
end, { desc = "Git Neogit Open in split" })

map("n", "<leader>gc", function()
  require("neogit").open { "commit" }
end, { desc = "Git Neogit Open commit popup" })

require("gitsigns").setup {
  on_attach = function(bufnr)
    local function gitsigns_map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    gitsigns_map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    gitsigns_map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    gitsigns_map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    gitsigns_map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    gitsigns_map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    gitsigns_map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    gitsigns_map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
    gitsigns_map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    gitsigns_map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
    gitsigns_map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    gitsigns_map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    gitsigns_map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    gitsigns_map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    gitsigns_map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    gitsigns_map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

    -- Text object
    gitsigns_map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    gitsigns_map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}

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

-- AI
map("i", "<A-;>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true, desc = "AI Codeium Accept" })

-- APM
local apm = require "vim-apm"
map("n", "<leader>apm", function()
  apm:toggle_monitor()
end, { desc = "APM-Monitor Toggle" })

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "sf", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- Session Manager
map({ "n" }, "<leader>ss", "<cmd>SessionManager<CR>", { desc = "SessionManager Open" })
map(
  { "n" },
  "<leader>sslc",
  "<cmd>SessionManager load_current_dir_session<CR>",
  { desc = "SessionManager Open Current Dir Session" }
)
map({ "n" }, "<leader>sslg", "<cmd>SessionManager load_git_session<CR>", { desc = "SessionManager Open Git Session" })

-- Games
map({ "n" }, "<leader>pgc", "<cmd>Playtime<CR>", { desc = "Games Play Card Games" })

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

-- Project
map("n", "<leader>p", function()
  require("telescope").extensions.projects.projects {}
end, { desc = "Todo Telescope Project Discover" })

-- Treesitter context
map("n", "<leader>tc", "<cmd>TSContextToggle<CR>", { desc = "Treesitter Context Toggle" })
