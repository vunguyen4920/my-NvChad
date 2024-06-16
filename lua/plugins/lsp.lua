local java_filetypes = {
  "java",
}

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = java_filetypes,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        -- defaults
        "lua_ls",

        -- web-dev
        "html",
        "cssls",
        "css_variables",
        "cssmodules_ls",
        "emmet_ls",
        "eslint",
        "volar",
        "lemminx",
        "yamlls",
        "jsonls",
        "tailwindcss",
        "somesass_ls",

        -- db
        "prismals",
        "graphql",

        -- documentation
        "marksman",

        -- general purpose
        "jdtls",
        "kotlin_language_server",
        "vtsls",
        "taplo",

        -- devops
        "dockerls",
        "docker_compose_language_service",
        "gradle_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mfussenegger/nvim-jdtls", "b0o/SchemaStore.nvim" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        -- defaults
        "stylua",

        -- documentation
        "markdownlint",

        -- web-dev
        "prettier",
        "prettierd",

        -- general
        "google-java-format",
        "ktlint",
      },
    },
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
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        -- defaults
        "selene",

        -- documentation
        "markdownlint",

        -- web-dev
        "eslint_d",

        -- general
        "checkstyle",
        "ktlint",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function()
      require "configs.dap"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        -- defaults

        -- web-dev
        "firefox",

        -- general
        "js",
        "javadbg",
        "javatest",
        "kotlin",
      },
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("telescope").load_extension "dap"
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
    event = "BufReadPre",
    config = function()
      require("ts-error-translator").setup {}
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
    event = "BufReadPre",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
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
        desc = "[G]oto [C]ode Actions [P]reviews",
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
}

return plugins
