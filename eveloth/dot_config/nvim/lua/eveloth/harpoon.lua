local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")
	local wk = require("which-key")

	local function nav(x)
		return function()
			ui.nav_file(x)
		end
	end

	wk.add({ "<leader>h", group = "Harpoon" }, { "<leader>h", ui.toggle_quick_menu }, { "<leader>a", mark.add_file })

	wk.add({
		hidden = true,
		{ "<leader>1", nav(1) },
		{ "<leader>1", nav(2) },
		{ "<leader>1", nav(3) },
		{ "<leader>1", nav(4) },
	})
end

return M
