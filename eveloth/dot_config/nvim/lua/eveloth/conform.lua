local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	require("conform").setup({
		formatters_by_ft = {
			cs = { "csharpier" },
		},
		formatters = {
			csharpier = {
				command = "dotnet-csharpier",
				args = { "--write-stdout" },
			},
		},
	})
end

return M
