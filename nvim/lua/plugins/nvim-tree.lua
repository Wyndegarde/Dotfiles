return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
    require("nvim-tree").setup({
      view = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {
          ".DS_Store",
          "^.git$",
          "__pycache__",
          "^.venv$",
          ".mypy_cache",
          ".ruff_cache",
          "**egg-info",
        },
      },
    })
    -- Remove status colum so tree isn't padded with dead space
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      callback = function()
        if vim.bo.filetype == "NvimTree" then
          vim.wo.statuscolumn = ""
        end
      end,
    })
  end,
}
