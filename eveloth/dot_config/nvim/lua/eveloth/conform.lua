local M = {
	"stevearc/conform.nvim",
	dependencies = {
		"folke/which-key.nvim",
	},
}

M.config = function()
	local conform = require("conform")

	conform.setup({
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			cs = { "csharpier" },
			rust = { "rustfmt", lsp_format = "fallback" },
			lua = { "stylua" },
			haskell = { "fourmolu" },
			kdl = { "kdlfmt" },
			hcl = { "hcl" },
		},
		formatters = {
			csharpier = {
				command = "dotnet-csharpier",
				args = { "--write-stdout" },
			},
		},
	})

	local wk = require("which-key")
	wk.add({
		{ "<leader>rc", conform.format, desc = "Format" },
	})
end

return M
