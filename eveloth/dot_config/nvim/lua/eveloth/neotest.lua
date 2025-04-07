local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
}

M.config = function()
	local wk = require("which-key")

	local neotest_golang_opts = {} -- Specify custom configuration
	require("neotest").setup({
		adapters = {
			require("neotest-golang")(neotest_golang_opts), -- Registration
		},
	})

	wk.add({
		{ "<leader>nt", "<cmd> lua require('neotest').run.run()<cr>", desc = "Run test" },
		{ "<leader>na", "<cmd> lua require('neotest').run.run(vim.uv.cwd())<cr>", desc = "Run test" },
		{ "<leader>ns", "<cmd> lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary" },
		{ "<leader>no", "<cmd> lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output" },
		--{ "<leader>nw", "<cmd> lua require('neotest').watch.toggle(vim.fn.expand("%"))<cr>", desc = "Toggle watch" },
	})
end

return M
