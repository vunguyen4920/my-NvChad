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
        "css_variables",
        "cssls",
        "cssmodules_ls",
        "emmet_ls",
        "eslint",
        "html",
        "jsonls",
        "lemminx",
        "somesass_ls",
        "svelte",
        "tailwindcss",
        "volar",
        "yamlls",
        "astro",

        -- db
        "graphql",
        "prismals",

        -- documentation
        "marksman",

        -- general purpose
        "jdtls",
        "kotlin_language_server",
        "taplo",
        "vtsls",
        "typos_lsp",

        -- devops
        "docker_compose_language_service",
        "dockerls",
        "gradle_ls",
        "groovyls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    dependencies = { "mfussenegger/nvim-jdtls", "b0o/SchemaStore.nvim" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
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

        -- general
        "google-java-format",
        "ktlint",

        -- devops
        "npm-groovy-lint",
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

        -- devops
        "hadolint",
        "npm-groovy-lint",

        -- general
        "checkstyle",
        "ktlint",
        "codespell",
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
    event = "BufReadPost",
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
    opts = {},
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
    event = "BufEnter",
    opts = {},
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  { "chrisgrieser/nvim-chainsaw" },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  { "yorickpeterse/nvim-pqf", ft = "qf" },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "felpafel/inlay-hint.nvim",
    event = "LspAttach",
    opts = {
      virt_text_pos = "inline",
    },
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
}

return plugins
