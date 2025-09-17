local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"ts_ls",
		"solidity",
		"tailwindcss",
		-- "pyright",
    "basedpyright",
    "ruff",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"jsonls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = {
    {"williamboman/mason.nvim"},
    {'WhoIsSethDaniel/mason-tool-installer.nvim' },
  }
}
