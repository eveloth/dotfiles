local M = {
	"williamboman/mason.nvim",
}

function M.config()
	local mason = require("mason")

	mason.setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
		ui = {
			border = "rounded",
		},
	})
end

return M
