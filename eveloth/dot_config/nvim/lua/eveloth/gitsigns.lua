local M = {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
}

function M.config()
	local wk = require("which-key")
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		on_attach = function()
			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>gb", gitsigns.blame, desc = "Blame" },
			})
		end,
	})
end

return M
