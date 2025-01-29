local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	local filename = {
		"filename",
		separator = { left = "", right = "" },
	}

	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = { filename },
			lualine_b = { "branch" },
			lualine_c = { "diagnostics" },
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = {},
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
