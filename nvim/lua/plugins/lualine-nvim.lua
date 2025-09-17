local config = function()
	local theme = require("lualine.themes.palenight")
	-- set bg transparency in all modes
	-- theme.normal.c.bg = nil
	-- theme.insert.c.bg = nil
	-- theme.visual.c.bg = nil
	-- theme.replace.c.bg = nil
	-- theme.command.c.bg = nil
	theme.normal.c.bg = "#1e1e2e"
	theme.normal.b.bg = "#11111b"
	theme.inactive.b.fg = "#bac2de"
	theme.inactive.b.bg = "#181825"

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
			component_separators = { right = "", left = "" },
			section_separators = { right = " ", left = " " },
		},
		tabline = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_c = {},
			lualine_x = { "filetype" },
			lualine_y = { "branch" },
			lualine_z = { "location" },
		},
		sections = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
