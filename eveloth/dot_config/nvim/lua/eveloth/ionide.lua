local M = {
	"ionide/Ionide-vim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"neovim/nvim-lspconfig",
		},
	},
}

return M
