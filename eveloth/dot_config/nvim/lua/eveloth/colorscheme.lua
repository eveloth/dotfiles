local M = {
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "alexxGmZ/e-ink.nvim", priority = 1000 },
	{ "LunarVim/darkplus.nvim", priority = 1000 },
	{ "thesimonho/kanagawa-paper.nvim", priority = 1000, opts = {} },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {} },
	{ "neanias/everforest-nvim", version = false, lazy = false, priority = 1000 },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({})
			require("bamboo").load()
		end,
	},
	{ "0xstepit/flow.nvim", lazy = false, priority = 1000, tag = "v2.0.2", opts = {} },
	{ "oxfist/night-owl.nvim", lazy = false, priority = 1000 },
}

return M
