local M = {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
}

function M.config()
	require("go").setup()
end

return M
