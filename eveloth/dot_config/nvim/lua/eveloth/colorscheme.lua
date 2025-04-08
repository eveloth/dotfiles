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
	{ "neanias/everforest-nvim", version = false, lazy = false, priority = 1000 },
	{ "ribru17/bamboo.nvim", lazy = false, priority = 1000 },
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		tag = "v2.0.2",
		opts = {},
	},
	{ "oxfist/night-owl.nvim", lazy = false, priority = 1000 },
}

M.config = function() end

return M
