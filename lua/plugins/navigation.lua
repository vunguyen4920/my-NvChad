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
        if vim.bo.filetype == "nvdash" then
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

      local ignored_filetypes = {
        ["qf"] = true,
        ["netrw"] = true,
        ["NvimTree"] = true,
        ["lazy"] = true,
        ["mason"] = true,
        ["oil"] = true,
        ["harpoon"] = true,
        ["spectre_panel"] = true,
        ["NeogitPopup"] = true,
        ["NeogitStatus"] = true,
      }
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistedSavePre",
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if ignored_filetypes[vim.bo[buf].filetype] then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end,
      })
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
}

return plugins
