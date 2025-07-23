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
			lualine_z = {
				{
          function ()
            return "test"
          end,
					icon = { "", color = { fg = "#e7c664" } },
					cond = function()
						if not package.loaded.dap then
							return false
						end
						local session = require("dap").session()
						return session ~= nil
					end,
				},
			},
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
