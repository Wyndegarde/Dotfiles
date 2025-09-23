local config = function()
  local harpoon = require("harpoon")

  -- REQUIRED
  harpoon:setup({
    global_settings = {
      save_on_toggle = true,
      save_on_change = true,
    },
  })

  -- Custom telescope picker for harpoon
  local function telescope_harpoon_files()
    local harpoon_files = harpoon:list()
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = require("telescope.config").values.file_previewer({}),
          sorter = require("telescope.config").values.generic_sorter({}),
        })
        :find()
  end

  -- Set up keymaps using vim.keymap.set directly
  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
  end, { desc = "Harpoon add file" })

  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, { desc = "Harpoon quick menu" })

  vim.keymap.set("n", "<leader>fh", telescope_harpoon_files, { desc = "Harpoon telescope" })

  -- Navigate to specific files
  vim.keymap.set("n", "<C-H2>", function()
    harpoon:list():select(1)
  end, { desc = "Harpoon file 1" })

  vim.keymap.set("n", "<C-t>", function()
    harpoon:list():select(2)
  end, { desc = "Harpoon file 2" })

  vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
  end, { desc = "Harpoon file 3" })

  vim.keymap.set("n", "<C-s>", function()
    harpoon:list():select(4)
  end, { desc = "Harpoon file 4" })

  -- Toggle previous & next buffers
  vim.keymap.set("n", "<leader>hn", function()
    harpoon:list():prev()
  end, { desc = "Harpoon prev" })

  vim.keymap.set("n", "<leader>hp", function()
    harpoon:list():next()
  end, { desc = "Harpoon next" })
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
}
