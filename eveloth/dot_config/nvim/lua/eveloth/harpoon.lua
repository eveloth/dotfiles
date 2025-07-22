local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

M.config = function()
	local harpoon = require("harpoon")
	local wk = require("which-key")
	harpoon:setup()

	local toggle_menu = function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end

	local add = function()
		harpoon:list():add()
	end

	local function nav(x)
		return function()
			harpoon:list():select(x)
		end
	end

	wk.add({
		{ "<leader>h", group = "Harpoon" },
		{ "<leader>hh", toggle_menu, desc = "Toggle menu" },
		{ "<leader>ha", add, desc = "Add" },
	})

	wk.add({
		{
			hidden = true,
			{ "<leader>1", nav(1) },
			{ "<leader>2", nav(2) },
			{ "<leader>3", nav(3) },
			{ "<leader>4", nav(4) },
		},
	})
end

return M
