local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"folke/which-key.nvim",
	},
}

M.config = function()
	require("notify").setup({
		timeout = 500,
		merge_duplicates = false,
	})
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
			hover = {
				enabled = false,
			},
		},

		views = {
			cmdline_popup = {
				position = {
					row = "40%",
					column = "50%",
				},
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	})

	local wk = require("which-key")
	wk.add({
		{
			"<leader>fn",
			function()
				vim.cmd("Noice pick")
			end,
		},
	})
end

return M
