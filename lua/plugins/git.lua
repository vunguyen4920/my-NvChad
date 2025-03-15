local plugins = {
  {
    "sindrets/diffview.nvim",
    event = "BufReadPost",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
    },
    config = function(_, opts)
      require("diffview").setup(opts)
      dofile(vim.g.base46_cache .. "diffview")
    end,
    keys = {
      {
        "<leader>gh",
        "<cmd>DiffviewFileHistory %<CR>",
        desc = "Git Diffview Current File [H]istory",
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function(_, opts)
      require("neogit").setup(opts)
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
    opts = {
      graph_style = "unicode",
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
    keys = function()
      local neogit = require "neogit"
      return {
        {
          "<leader>gg",
          neogit.open,
          desc = "Git Neogit Open",
        },
        {
          "<leader>gs",
          function()
            neogit.open { kind = "split" }
          end,
          desc = "Git Neogit Open Split",
        },
      }
    end,
  },
}

return plugins
