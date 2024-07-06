local plugins = {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local harpoon = require "harpoon"
      --
      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      return {
        {
          "<leader>a",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon [A]dd",
        },
        {
          "<C-a>",
          function()
            toggle_telescope(harpoon:list())
          end,
          desc = "Harpoon Menu",
        },
        {
          "<C-q>",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon [Q]uick Menu",
        },
        {
          "<A-q>",
          function()
            harpoon:list():select(1)
          end,
          desc = "Harpoon Select 1",
        },
        {
          "<A-w>",
          function()
            harpoon:list():select(2)
          end,
          desc = "Harpoon Select 2",
        },
        {
          "<A-e>",
          function()
            harpoon:list():select(3)
          end,
          desc = "Harpoon Select 3",
        },
        {
          "<A-r>",
          function()
            harpoon:list():select(4)
          end,
          desc = "Harpoon Select 4",
        },
        {
          "<A-a>",
          function()
            harpoon:list():select(5)
          end,
          desc = "Harpoon Select 5",
        },
        {
          "<A-s>",
          function()
            harpoon:list():select(6)
          end,
          desc = "Harpoon Select 6",
        },
        {
          "<A-d>",
          function()
            harpoon:list():select(7)
          end,
          desc = "Harpoon Select 7",
        },
        {
          "<A-f>",
          function()
            harpoon:list():select(8)
          end,
          desc = "Harpoon Select 8",
        },
        {
          "<C-k>",
          function()
            harpoon:list():prev()
          end,
          desc = "Harpoon Prev",
        },
        {
          "<C-j>",
          function()
            harpoon:list():next()
          end,
          desc = "Harpoon Next",
        },
      }
    end,
    opts = {},
  },
}

return plugins
