local M = {
	"seblyng/roslyn.nvim",
	ft = "cs",
	opts = {
		-- your configuration comes here; leave empty for default settings
	},
}

M.config = function()
	local roslyn = require("roslyn")
	roslyn.setup({
		exe = {
			"dotnet-bin-9.0",
			vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
		},
	})
end

return M
