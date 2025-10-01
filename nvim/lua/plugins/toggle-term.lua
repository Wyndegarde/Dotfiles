return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    local function get_venv_command()
      local venv_path = vim.fn.getcwd() .. "/.venv"
      if vim.fn.isdirectory(venv_path) == 1 then
        return "source .venv/bin/activate"
      end
      return ""
    end
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-p>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- or 'horizontal', 'vertical', 'tab'
      close_on_exit = false,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      -- Auto-activate venv if present
      on_create = function(term)
        local venv_cmd = get_venv_command()
        if venv_cmd ~= "" then
          -- Send the activation command to the terminal
          vim.api.nvim_chan_send(term.job_id, venv_cmd .. "\n")
        end
      end,
    })
    local Cursor_Terminal = require("toggleterm.terminal").Terminal
    local cursor = Cursor_Terminal:new({ cmd = "cursor-agent", hidden = true })

    function _cursor_toggle()
      cursor:toggle()
    end

    vim.api.nvim_set_keymap("n", "<c-g>", "<cmd>lua _cursor_toggle()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<c-g>", "<cmd>lua _cursor_toggle()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("i", "<leader>g", "<cmd>lua _cursor_toggle()<CR>", { noremap = true, silent = true })
  end,
}
