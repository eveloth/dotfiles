local M = {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}

M.config = function()
	local trouble = require("trouble")
	trouble.setup({
	})

	local wk = require("which-key")
	wk.add({
		{ "<leader>xa", "<cmd>Trouble diagnostics toggle<cr>", decs = "Diagnostics" },
	})
end

return M
