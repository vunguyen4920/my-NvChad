local plugins = {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
        "harpoon",
        "spectre_panel",
        "NeogitPopup",
        "NeogitStatus",
      },
    },
    event = "BufEnter",
  },
}

return plugins
