local M = {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 998,
	},
	{
		"alexxGmZ/e-ink.nvim",
		lazy = false,
		priority = 999,
	},
	{
		"LunarVim/darkplus.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		lazy = false,
    name = "catppuccin",
		priority = 1000,
		opts = {},
	},
}

M.config = function() end

return M
