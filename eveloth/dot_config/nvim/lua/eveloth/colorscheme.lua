local M = {
	{
		"LunarVim/darkplus.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 999,
	},
}

return M
