local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	require("conform").setup({
		formatters_by_ft = {
			cs = { "csharpier" },
			rust = { "rustfmt", lsp_format = "fallback" },
			lua = { "stylua" },
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
