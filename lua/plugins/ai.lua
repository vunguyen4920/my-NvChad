local plugins = {
  {
    "Exafunction/codeium.vim",
    cmd = "Codeium",
    event = "BufEnter",
    build = ":Codeium Auth",
    keys = {
      {
        mode = { "i" },
        "<A-;>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        expr = true,
        silent = true,
        desc = "AI Codeium Accept",
      },
      {
        mode = { "n" },
        "<leader>ai",
        function()
          return vim.fn["codeium#Chat"]()
        end,
        expr = true,
        silent = true,
        desc = "AI Chat",
      },
    },
  },
}

return plugins
