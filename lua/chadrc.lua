-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",

  integrations = {
    "dap",
    "diffview",
    "git-conflict",
    "neogit",
    "rainbowdelimiters",
    "semantic_tokens",
    "trouble",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvDashAscii = {
      bg = "black2",
      fg = "blue",
      reverse = true,
    },
    NvDashButtons = {
      bg = "black2",
      fg = "blue",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = require "headers",

  buttons = {
    { txt = "  Previous Sessions", keys = "sr", cmd = "SessionLoad" },
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.ui = {
  cmp = {
    style = "atom_colored",
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  telescope = {
    style = "bordered",
  },

  tabufline = {
    show_numbers = true,
    lazyload = true,
  },
}

-- clipboard
local in_wsl = os.getenv "WSL_DISTRO_NAME" ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "nvdash",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

autocmd("BufWinLeave", {
  callback = function()
    if vim.bo.ft == "nvdash" then
      vim.opt.laststatus = 3
    end
  end,
})

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

return M
