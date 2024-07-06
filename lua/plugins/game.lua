local plugins = {
  {
    "rktjmp/playtime.nvim",
    opts = {},
    keys = {
      {
        "<leader>gac",
        "<cmd>Playtime<CR>",
        desc = "[Ga]mes Play Card Games",
      },
    },
  },
  { "andweeb/presence.nvim", opts = {} },
}

return plugins
