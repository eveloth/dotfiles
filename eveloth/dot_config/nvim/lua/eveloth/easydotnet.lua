local M = {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
}

function M.config()
	require("easy-dotnet").setup()
end

return M
