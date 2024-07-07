local plugins = {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>s",
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "[S]earch on current file",
      },
      {
        "<leader>S",
        "<cmd>lua require('spectre').toggle()<CR>",
        desc = "[S]earch Toggle",
      },
      {
        "<leader>sw",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "[S]earch Current word",
      },
      {
        mode = { "v" },
        "<leader>sw",
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        desc = "[S]earch Current word",
      },
    },
  },
}

return plugins
