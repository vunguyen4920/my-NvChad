local plugins = {
  {
    "Isrothy/neominimap.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", --- Recommended
    },
    enabled = true,
    event = "BufReadPost",
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
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    opts = {
      use_git_branch = true,
      should_save = function()
        -- Do not save if the alpha dashboard is the current filetype
        local ignored_filetypes = {
          ["nvdash"] = true,
          ["Avante"] = true,
          ["AvanteInput"] = true,
          ["AvanteSelectedFiles"] = true,
          ["NeogitPopup"] = true,
          ["NeogitStatus"] = true,
          ["NvimTree"] = true,
          ["Outline"] = true,
          ["harpoon"] = true,
          ["lazy"] = true,
          ["mason"] = true,
          ["netrw"] = true,
          ["oil"] = true,
          ["qf"] = true,
          ["spectre_panel"] = true,
        }
        if ignored_filetypes[vim.bo.filetype] then
          return false
        end
        return true
      end,
    },
    config = function(_, opts)
      require("persisted").setup(opts)
      require("telescope").setup {
        extensions = {
          persisted = {
            layout_config = { width = 0.55, height = 0.55 },
          },
        },
      }
    end,
    keys = function()
      return {
        {
          "<leader>st",
          "<cmd>SessionToggle<CR>",
          { desc = "[S]ession [T]oggle" },
        },
        {
          "<leader>sr",
          "<cmd>SessionLoad<CR>",
          { desc = "[S]ession [R]estore" },
        },
        {
          "<leader>sl",
          "<cmd>SessionLoadLast<CR>",
          { desc = "[S]ession Load [L]ast" },
        },
        {
          "<leader>sx",
          "<cmd>SessionDelete<CR>",
          { desc = "[S]ession Delete" },
        },
        {
          "<leader>ss",
          "<cmd>Telescope persisted<CR>",
          { desc = "[S]ession [S]elect" },
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}

return plugins
