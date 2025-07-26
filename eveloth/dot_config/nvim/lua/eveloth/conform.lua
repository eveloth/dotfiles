local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	require("conform").setup({
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			cs = { "csharpier" },
			rust = { "rustfmt", lsp_format = "fallback" },
			lua = { "stylua" },
			haskell = { "fourmolu" },
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
