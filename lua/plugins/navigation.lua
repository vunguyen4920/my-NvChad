local plugins = {
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
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    config = function()
      require("neoscroll").setup {
        easing_function = "sine",
      }
    end,
  },
  {
    "gnikdroy/projections.nvim",
    cmd = { "StoreProjectSession", "RestoreProjectSession", "AddWorkspace" },
    opts = {
      store_hooks = {
        pre = function()
          -- nvim-tree
          local nvim_tree_present, api = pcall(require, "nvim-tree.api")
          if nvim_tree_present then
            api.tree.close()
          end
        end,
      },
      workspaces = {
        { "~/projects", {} },
        { "~/.config", {} },
      },
      patterns = { ".git", ".svn", ".hg", "package.json", "pom.xml" },
    },
    config = function(_, opts)
      require("projections").setup(opts)

      -- Bind <leader>fp to Telescope projections
      require("telescope").load_extension "projections"

      -- Autostore session on VimExit
      local Session = require "projections.session"
      vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
        callback = function()
          Session.store(vim.loop.cwd())
        end,
      })

      -- Switch to project if vim was started in a project dir
      local switcher = require "projections.switcher"
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() == 0 then
            switcher.switch(vim.loop.cwd())
          end
        end,
      })

      vim.api.nvim_create_user_command("StoreProjectSession", function()
        Session.store(vim.loop.cwd())
      end, {})

      vim.api.nvim_create_user_command("RestoreProjectSession", function()
        Session.restore(vim.loop.cwd())
      end, {})

      local Workspace = require "projections.workspace"
      -- Add workspace command
      vim.api.nvim_create_user_command("AddWorkspace", function()
        Workspace.add(vim.loop.cwd())
      end, {})
    end,
    branch = "pre_release",
    keys = {
      {
        "<leader>p",
        "<cmd>Telescope projections<CR>",
        { desc = "Projects Telescope" },
      },
      {
        "<leader>pa",
        "<cmd>AddWorkspace<CR>",
        { desc = "Projects Add Workspace" },
      },
      {
        "<leader>sr",
        "<cmd>RestoreProjectSession<CR>",
        { desc = "Projects Restore Session" },
      },
    },
  },
}
return plugins
