---@class vim.diagnostic.Opts
local diagnosticOpts = {
	virtual_text = false,
	virtual_lines = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	severity_sort = true,
	float = {
		border = "rounded",
	},
	jump = {
		float = true,
	},
}

---@return lsp.ClientCapabilities
local function make_client_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = true,
		lineFoldingOnly = true,
	}
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.semanticTokens.multilineTokenSupport = true
	-- so that gopls can pickup go.mod changes (probably useful in other places too)
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return capabilities
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		-- disable semanticTokensProvider thus fixing tree-sitter
		-- UPD I changed my mind
		-- client.server_capabilities.semanticTokensProvider = nil

		-- disable embedded hover since we have better one
		pcall(vim.keymap.del, "n", "K", { buffer = bufnr })

		local lspKeymap = require("eveloth.lsp-keymap")
		---@diagnostic disable-next-line: missing-parameter
		lspKeymap.set_keymap()
	end,
})

vim.diagnostic.config(diagnosticOpts)

local clientCapabilities = make_client_capabilities()

-- '*' means 'for all servers', I didn't know you could do that
vim.lsp.config("*", {
	capabilities = clientCapabilities,
})

-- leaving this for backwards compatibility,
-- it is a better idea to have just one conf file in {vim.rtp}/lsp
local servers = {
	"roslyn_ls",
	"basedpyright",
	"lua_ls",
	"cssls",
	"html",
	"ts_ls",
	"bashls",
	"jsonls",
	"yamlls",
	"marksman",
	"clangd",
	"gopls",
	"sqls",
	"terraformls",
	"jdtls",
	"rust_analyzer",
	"zls",
	"hls",
}

for _, server in pairs(servers) do
	vim.lsp.enable(server)
	local require_ok, settings = pcall(require, "eveloth.lspsettings." .. server)
	if require_ok then
		vim.lsp.config(server, settings)
	end
end
