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
        "Outline",
        "Avante",
        "AvanteInput",
        "AvanteSelectedFiles",
      },
    },
    event = "BufEnter",
  },
}

return plugins
