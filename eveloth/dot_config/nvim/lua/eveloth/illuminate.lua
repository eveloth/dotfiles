local M = {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	dependencies = {
		"folke/which-key.nvim",
	},
}

function M.config()
	local illuminate = require("illuminate")

	illuminate.configure({
		filetypes_denylist = {
			"mason",
			"harpoon",
			"DressingInput",
			"NeogitCommitMessage",
			"qf",
			"dirvish",
			"oil",
			"minifiles",
			"fugitive",
			"alpha",
			"NvimTree",
			"lazy",
			"NeogitStatus",
			"Trouble",
			"netrw",
			"lir",
			"DiffviewFiles",
			"spectre_panel",
			"DressingSelect",
			"TelescopePrompt",
		},
	})

	local wk = require("which-key")
	wk.add({
		{ "<leader>r", illuminate.goto_next_reference, desc = "Next reference" },
		-- won't work, pastes instead of doing the job
		{ "<leader>p", illuminate.goto_pref_reference, desc = "Previous reference" },
	})
end

return M
