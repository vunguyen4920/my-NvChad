local plugins = {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "iamyoki/buffer-reopen.nvim",
    event = "BufEnter",
    opts = {},
  },
}

return plugins
