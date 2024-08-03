local plugins = {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "harpoon", "spectre" },
    },
    event = "BufEnter",
  },
  {
    "Isrothy/neominimap.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", --- Recommended
    },
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    init = function()
      vim.opt.wrap = false -- Recommended
      vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
      vim.g.neominimap = {
        auto_enable = true,

        -- When false is returned, the minimap will not be created for this buffer
        ---@type fun(bufnr: number): boolean
        buf_filter = function(bufnr)
          local line_count = vim.api.nvim_buf_line_count(bufnr)
          return line_count < 4096
        end,
      }
    end,
    keys = function()
      local neominimap = require "neominimap"
      return {
        {
          mode = { "n" },
          "<leader>mm",
          function()
            neominimap.toggle()
          end,
          expr = true,
          silent = true,
          desc = "[M]inimap [T]oggle",
        },
        {
          mode = { "n" },
          "<leader>mr",
          function()
            neominimap.refresh()
          end,
          expr = true,
          silent = true,
          desc = "[M]inimap [R]efresh",
        },
      }
    end,
  },
}

return plugins
