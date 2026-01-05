local M = {
	"OXY2DEV/markview.nvim",
	lazy = false,
}

M.config = function()
	local makrview = require("markview")

	makrview.setup({
		preview = { enable = false },
	})

	local wk = require("which-key")
	wk.add({
		{
			"<leader>mm",
			function()
				vim.cmd("Markview toggle")
			end,
			desc = "Preview markdown",
		},
	})
end

return M
