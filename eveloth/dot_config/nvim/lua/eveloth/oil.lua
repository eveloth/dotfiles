local M = {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
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
