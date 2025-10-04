return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = false, -- Load immediately since it affects visual appearance
  opts = {
    indent = {
      char = "|", -- Character to use for indentation lines
      tab_char = "│", -- Character to use for tab indentation
    },
    scope = {
      enabled = true,
      char = "│", -- Character to use for scope lines
      show_start = true,
      show_end = true,
      show_exact_scope = true,
      highlight = "IblScopeChar",
      priority = 1024,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f4b8e4" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#cba6f7" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#d99e91" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#b4befe" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89dceb" })
    end)

    require("ibl").setup({
      -- indent = { highlight = highlight }
    }
    )
  end
}
