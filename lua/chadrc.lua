-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyodark",

  nvdash = {
    load_on_startup = true,
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- git
require("neogit").setup {
  integrations = {
    diffview = true,
    telescope = true,
  },
}
require("diffview").setup {}

-- ui
require("trouble").setup {}
require("ts-error-translator").setup {}

-- misc
require("hardtime").setup {}

return M
