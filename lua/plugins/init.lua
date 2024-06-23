return {
  {
    "ThePrimeagen/vim-apm",
    opts = {},
    config = function()
      local apm = require "vim-apm"

      apm:setup {}
    end,
  },
}
