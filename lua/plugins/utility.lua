local plugins = {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    opts = {},
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
        close_fold_kinds_for_ft = {
          default = { "imports", "comment" },
        },
      }

      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    opts = {},
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "[C]olor [P]icker" },
    },
  },
}

return plugins
