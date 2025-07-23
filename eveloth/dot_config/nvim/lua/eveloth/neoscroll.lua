local M = {
	"karb94/neoscroll.nvim",
	opts = {},
}

M.config = function()
	require("neoscroll").setup({
		duration_multiplier = 0.5,
	})
end

return M
