local M = {
	"echasnovski/mini.nvim",

	version = "*",
}

M.config = function()
	require("mini.ai").setup()
	require("mini.surround").setup({})
	require("mini.icons").setup()
	require("mini.colors").setup()
	MiniIcons.mock_nvim_web_devicons()
end

return M
