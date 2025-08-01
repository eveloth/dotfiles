local M = {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}

function M.config()
	require("oil").setup()
	local wk = require("which-key")
	wk.add({
		"<leader>dr",
		function()
			vim.cmd("Oil")
		end,
	})
end

return M
