local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
}

function M.config()
	local wk = require("which-key")

	local lazygitOpts = {
		cmd = "lazygit",
		direction = "float",
		hidden = true,
	}

	local Term = require("toggleterm.terminal").Terminal
	local lazygit = Term:new(lazygitOpts)
	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	wk.add({
		{ "<leader>t", group = "Terminal" },
		{ "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Floating terminal" },
		{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Close terminal", mode = "t" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
	})

	require("toggleterm").setup({
		open_mapping = [[<c-\>]],
		direction = "float",
		size = function(term)
			if term.direction == "horizontal" then
				return 10
			end
		end,
	})
end

return M
