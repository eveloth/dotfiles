local M = {
	"apple/pkl-neovim",
	lazy = true,
	ft = "pkl",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = function(_)
				vim.cmd("TSUpdate")
			end,
		},
	},
	build = function()
		require("pkl-neovim").init()

		vim.cmd("TSInstall pkl")
	end,
	config = function()
		vim.g.pkl_neovim = {
			start_command = { "pkl-lsp" },
			pkl_cli_path = "pkl-lsp",
		}
	end,
}

return M
