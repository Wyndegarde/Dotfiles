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
		-- Disable columns in NvimTree window to prevent shifting
		local group = vim.api.nvim_create_augroup("NvimTreeNoColumns", { clear = true })
		vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "WinEnter" }, {
			group = group,
			callback = function(args)
				local buf = args.buf
				if vim.bo[buf].filetype == "NvimTree" then
					local win = vim.fn.bufwinid(buf)
					if win ~= -1 then
						vim.wo[win].statuscolumn = ""
						vim.wo[win].number = false
						vim.wo[win].relativenumber = false
						vim.wo[win].signcolumn = "no"
						vim.wo[win].foldcolumn = "0"
					end
				end
			end,
		})
	end,
}
