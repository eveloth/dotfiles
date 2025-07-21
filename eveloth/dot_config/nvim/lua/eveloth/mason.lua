local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"bashls",
		"jsonls",
		"yamlls",
		"marksman",
		"clangd",
		"jdtls"
	}

	require("mason").setup({
     registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
     },
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
end

return M
