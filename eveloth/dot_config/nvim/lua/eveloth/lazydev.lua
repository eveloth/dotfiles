local M = {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		---@class lazydev.Config
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}

return M
