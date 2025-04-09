local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "b0o/SchemaStore.nvim",
    event = "LspAttach",
    version = false, -- last release is way too old
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    dependencies = { "mfussenegger/nvim-jdtls", "b0o/SchemaStore.nvim" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
    event = "LspAttach",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function(_, opts)
      require("trouble").setup(opts)
      dofile(vim.g.base46_cache .. "trouble")
    end,
    keys = {
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble Diagnostics Open",
      },
      {
        "<leader>tD",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Trouble Diagnostics Current Buf Open",
      },
    },
  },
  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      { "<leader>tw", "<cmd>TWValues<cr>", desc = "[T]ailwind [V]alues" },
    },
    opts = {
      border = "rounded", -- Valid window border style,
      show_unknown_classes = true, -- Shows the unknown classes popup
      focus_preview = true, -- Sets the preview as the current window
      copy_register = "", -- The register to copy values to,
      keymaps = {
        copy = "<C-y>", -- Normal mode keymap to copy the CSS values between {}
      },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "[U]ndo history",
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension "undo"
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    keys = {
      {
        mode = { "n", "v" },
        "gap",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "[G]oto Code [A]ctions [P]reviews",
      },
    },
    config = function()
      require("actions-preview").setup {
        telescope = {
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = "top",
            preview_cutoff = 20,
          },
        },
      }
    end,
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "LspAttach",
    opts = {},
  },
  {
    "folke/neodev.nvim",
    event = "LspAttach",
    opts = {},
    config = function()
      require("neodev").setup {
        library = { enabled = true, runtime = true, types = true },
        setup_jsonls = true,
        lspconfig = true,
        pathStrict = true,
      }
    end,
  },
  {
    "chrisgrieser/nvim-chainsaw",
    opts = {
      marker = "🚀",
    },
    config = function(_, opts)
      require("chainsaw").setup(opts)
    end,
    keys = function()
      local chainsaw = require "chainsaw"
      return {
        {
          "<leader>cv",
          function()
            chainsaw.variableLog()
          end,
          desc = "Chainsaw Variable Log",
        },
        {
          "<leader>co",
          function()
            chainsaw.objectLog()
          end,
          desc = "Chainsaw Object Log",
        },
        {
          "<leader>cs",
          function()
            chainsaw.stacktraceLog()
          end,
          desc = "Chainsaw Stacktrace Log",
        },
        {
          "<leader>cas",
          function()
            chainsaw.assertLog()
          end,
          desc = "Chainsaw Assert Log",
        },
        {
          "<leader>cm",
          function()
            chainsaw.messageLog()
          end,
          desc = "Chainsaw Message Log",
        },
        {
          "<leader>cb",
          function()
            chainsaw.beepLog()
          end,
          desc = "Chainsaw Beep Log",
        },
        {
          "<leader>ct",
          function()
            chainsaw.timeLog()
          end,
          desc = "Chainsaw Time Log",
        },
        {
          "<leader>cd",
          function()
            chainsaw.debugLog()
          end,
          desc = "Chainsaw Debug Log",
        },
        {
          "<leader>cr",
          function()
            chainsaw.removeLogs()
          end,
          desc = "Chainsaw Remove Logs",
        },
      }
    end,
  },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  { "yorickpeterse/nvim-pqf", ft = "qf" },
}

return plugins
