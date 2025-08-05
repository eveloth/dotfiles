local M = {
	"folke/which-key.nvim",
}

function M.config()
	local which_key = require("which-key")
	which_key.setup({
		notify = false,
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		window = {
			border = "rounded",
			position = "bottom",
			padding = { 2, 2, 2, 2 },
		},
		ignore_missing = true,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "snacks_picker_input" },
		},
	})

	which_key.add({
		{
			"<leader>?",
			function()
				which_key.show()
			end,
			desc = "Help",
		},
		{
			"<leader>w",
			function()
				vim.cmd("silent! wa")
			end,
			desc = "Write all",
		},
		{
			"<leader>qq",
			function()
				vim.cmd("silent! q")
			end,
			desc = "Close current",
		},
		{
			"<leader>qa",
			function()
				vim.cmd("silent! qa")
			end,
			desc = "Close all",
		},
	})
end

return M
