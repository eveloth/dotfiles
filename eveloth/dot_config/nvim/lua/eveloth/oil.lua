local M = {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	lazy = false,
}

function M.config()
	---@class oil.SetupOpts
	opts = {
		keymaps = {
			["gp"] = { "actions.yank_entry", mode = "n" },
		},
		view_options = {
			show_hidden = true,
		},
	}
	require("oil").setup(opts)
	local wk = require("which-key")
	wk.add({
		"<leader>dr",
		function()
			vim.cmd("Oil")
		end,
	})
end

return M
