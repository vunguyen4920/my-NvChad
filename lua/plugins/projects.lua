local plugins = {
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
  },
}

return plugins
