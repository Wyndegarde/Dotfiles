local mapkey = require("util.keymapper").mapkey

local ignore_filetypes_list = {
	"venv",
	"__pycache__",
	"%.xlsx",
	"%.jpg",
	"%.png",
	"%.webp",
	"%.pdf",
	"%.odt",
	"%.ico",
	"%.git",
}

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
			file_ignore_patterns = ignore_filetypes_list,
		},
		pickers = {
			find_files = {
				theme = "ivy",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "ivy",
				previewer = true,
			},
			buffers = {
				theme = "ivy",
				previewer = true,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>ft", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fb", "Telescope buffers", "n"),
		mapkey("<leader>fl", "Telescope lsp_document_symbols", "n"),
	},
}
