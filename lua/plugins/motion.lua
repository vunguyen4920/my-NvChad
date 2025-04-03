local plugins = {
  {
    "folke/flash.nvim",
    event = "BufEnter",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
        char = {
          jump_labels = true,
        },
      },
    },
    keys = {
      {
        mode = { "n", "x", "o" },
        "s",
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
      {
        mode = { "n", "x", "o" },
        "Z",
        function()
          require("flash").jump {
            pattern = vim.fn.expand "<cword>",
          }
        end,
        desc = "Flash Remote",
      },
    },
  },
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
          "<leader>hm",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon [M]ark",
        },
        {
          "<leader>hl",
          function()
            toggle_telescope(harpoon:list())
          end,
          desc = "Harpoon Telescope [L]ist",
        },
        {
          "<leader>hq",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon [Q]uick Menu",
        },
        {
          "<M-q>",
          function()
            harpoon:list():select(1)
          end,
          desc = "Harpoon Select 1",
        },
        {
          "<M-w>",
          function()
            harpoon:list():select(2)
          end,
          desc = "Harpoon Select 2",
        },
        {
          "<M-e>",
          function()
            harpoon:list():select(3)
          end,
          desc = "Harpoon Select 3",
        },
        {
          "<M-r>",
          function()
            harpoon:list():select(4)
          end,
          desc = "Harpoon Select 4",
        },
        {
          "<M-z>",
          function()
            harpoon:list():select(5)
          end,
          desc = "Harpoon Select 5",
        },
        {
          "<M-x>",
          function()
            harpoon:list():select(6)
          end,
          desc = "Harpoon Select 6",
        },
        {
          "<M-c>",
          function()
            harpoon:list():select(7)
          end,
          desc = "Harpoon Select 7",
        },
        {
          "<C-[>",
          function()
            harpoon:list():prev()
          end,
          desc = "Harpoon Prev",
        },
        {
          "<C-]>",
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
