local M = {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"folke/which-key.nvim",
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
}

function M.config()
	local dbee = require("dbee")
	dbee.setup({})
	local wk = require("which-key")

	wk.add({
		{
			"<leader>ed",
			dbee.open,
			desc = "Database viewer",
		},
	})
end

return M
