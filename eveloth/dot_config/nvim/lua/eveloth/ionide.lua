local M = {
	"ionide/Ionide-vim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"neovim/nvim-lspconfig",
		},
	},
}

M.config = function()
end

return M

