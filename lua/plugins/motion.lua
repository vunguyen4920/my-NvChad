local plugins = {
  {
    "folke/flash.nvim",
    event = "BufEnter",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
        char = {
          jump_labels = true,
        },
      },
    },
    keys = {
      {
        mode = { "n", "x", "o" },
        "s",
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
      {
        mode = { "n", "x", "o" },
        "Z",
        function()
          require("flash").jump {
            pattern = vim.fn.expand "<cword>",
          }
        end,
        desc = "Flash Remote",
      },
    },
  },
}

return plugins
