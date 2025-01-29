local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
}

M.config = function()
	require("fzf-lua").setup()
end

return M
