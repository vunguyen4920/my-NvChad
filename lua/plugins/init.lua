return {
  {
    "ThePrimeagen/vim-apm",
    opts = {},
    config = function()
      local apm = require "vim-apm"

      apm:setup {}
    end,
    keys = function()
      return {
        {
          "<leader>apm",
          function()
            require("vim-apm"):toggle_monitor()
          end,
          desc = "APM-Monitor Toggle",
        },
      }
    end,
  },
}
