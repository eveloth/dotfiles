local M = {
	"echasnovski/mini.nvim",
	version = "*",
}

M.config = function()
	require("mini.ai").setup()
end

return M

