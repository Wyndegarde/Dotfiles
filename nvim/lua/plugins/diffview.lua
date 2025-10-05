return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    require("diffview").setup({

      vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", {}),
      vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", {}),
    })
  end
}
