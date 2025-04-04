local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = true, -- Auto close on trailing </
    },
    config = function(_, opts)
      require("nvim-ts-autotag").setup {
        opts,
      }

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
          spacing = 5,
          severity = { min = vim.diagnostic.severity.WARN },
        },
        update_in_insert = true,
      })
    end,
  },
  {
    "andersevenrud/nvim_context_vt",
    opts = {},
    config = function()
      require("nvim_context_vt").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      multiline_threshold = 1,
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
    keys = {
      {
        "<leader>tc",
        "<cmd>TSContextToggle<CR>",
        desc = "Treesitter Context Toggle",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup {
        padding = true,
        sticky = true,
        ignore = "^$",
        pre_hook = prehook,
        post_hook = nil,
      }
    end,
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {},
        config = function()
          vim.g.skip_ts_context_commentstring_module = true
        end,
        event = "BufReadPost",
      },
    },
  },
  {
    "echasnovski/mini.move",
    event = "BufReadPost",
    opts = {},
  },
  {
    "gbprod/yanky.nvim",
    recommended = true,
    desc = "Better Yank/Paste",
    event = "BufEnter",
    opts = {
      highlight = { timer = 100 },
    },
    keys = {
      {
        "<leader>y",
        function()
          require("telescope").extensions.yank_history.yank_history {}
        end,
        desc = "Open Yank History",
      },
        -- stylua: ignore
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Yanked Text After Cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Yanked Text Before Cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Yanked Text After Selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Yanked Text Before Selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
    },
  },
  {
    "lewis6991/spaceless.nvim",
    opts = {},
    event = "BufEnter",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
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
    "davidmh/mdx.nvim",
    event = "BufEnter *.mdx",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "monaqa/dial.nvim",
    event = "BufEnter",
    keys = {
      {
        "<C-a>",
        function()
          return M.dial(true)
        end,
        expr = true,
        desc = "Increment",
        mode = { "n", "v" },
      },
      {
        "<C-x>",
        function()
          return M.dial(false)
        end,
        expr = true,
        desc = "Decrement",
        mode = { "n", "v" },
      },
      {
        "g<C-a>",
        function()
          return M.dial(true, true)
        end,
        expr = true,
        desc = "Increment",
        mode = { "n", "v" },
      },
      {
        "g<C-x>",
        function()
          return M.dial(false, true)
        end,
        expr = true,
        desc = "Decrement",
        mode = { "n", "v" },
      },
    },
    opts = function()
      return require "configs.dial"
    end,
    config = function(_, opts)
      -- copy defaults to each group
      for name, group in pairs(opts.groups) do
        if name ~= "default" then
          vim.list_extend(group, opts.groups.default)
        end
      end
      require("dial.config").augends:register_group(opts.groups)
      vim.g.dials_by_ft = opts.dials_by_ft
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      dofile(vim.g.base46_cache .. "rainbowdelimiters")
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}

return plugins
