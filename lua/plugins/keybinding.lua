local plugins = {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    event = "BufEnter",
  },
  {
    "tris203/hawtkeys.nvim",
    cmd = "Hawtkeys",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = {
      -- an empty table will work for default config
      --- if you use functions, or whichkey, or lazy to map keys
      --- then please see the API below for options
    },
  },
}

return plugins
