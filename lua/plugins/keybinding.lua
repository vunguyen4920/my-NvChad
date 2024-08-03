local plugins = {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    event = "BufEnter",
  },
  {
    "iamyoki/buffer-reopen.nvim",
    event = "BufEnter",
    opts = {},
  },
}

return plugins
