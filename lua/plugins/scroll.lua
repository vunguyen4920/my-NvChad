local plugins = {
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    config = function()
      require("neoscroll").setup {
        easing_function = "sine",
      }
    end,
  },
}

return plugins
