local plugins = {
  {
    "uga-rosa/ccc.nvim",
    opts = {},
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "[C]olor [P]icker" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}

return plugins
