local M = {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/snacks.nvim",
		"folke/which-key.nvim",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
}

M.config = function()
	require("todo-comments").setup()

	local wk = require("which-key")
	local picker = require("snacks").picker
	wk.add({
		---I know this exists
		---@diagnostic disable-next-line: undefined-field
		{ "<leader>fw", picker.todo_comments, desc = "Todo items" },
	})
end

return M
