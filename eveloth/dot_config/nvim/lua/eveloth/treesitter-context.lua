local M = {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	require("treesitter-context").setup({
		max_lines = 3,
	})
end

return M
