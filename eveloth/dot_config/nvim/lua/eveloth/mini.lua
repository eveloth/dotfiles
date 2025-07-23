local M = {
	"echasnovski/mini.nvim",
	version = "*",
}

M.config = function()
	require("mini.ai").setup()
  require("mini.surround").setup()
end

return M

