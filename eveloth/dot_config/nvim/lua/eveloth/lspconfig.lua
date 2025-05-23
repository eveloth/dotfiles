local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({border=\"rounded\"})<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)

	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true)
	end
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }))
end

function M.config()
	local wk = require("which-key")
	wk.add({
		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
		{ "<leader>lh", "<cmd>lua require('eveloth.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
		{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
		{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "Diagnosics" },
		{ "<leader>lsf", "<cmd>Telescope lsp_document_symbols symbols=function,method<cr>", desc = "Functions" },
		{ "<leader>lss", "<cmd>Telescope lsp_document_symbols symbols=struct,class<cr>", desc = "Structs & classes" },
		{ "<leader>lsv", "<cmd>Telescope lsp_document_symbols symbols=variable<cr>", desc = "Variables" },
		{
			"<leader>rf",
			"<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
			desc = "Format",
		},
		{ "<leader>rc", "<cmd>lua require('conform').format()<cr>", desc = "csharpier" },
	})

	wk.add({
		{
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
		},
	})

	local lspconfig = require("lspconfig")
	local icons = require("eveloth.icons")

	local servers = {
    "pylsp",
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"bashls",
		"jsonls",
		"yamlls",
		"marksman",
		"clangd",
		"omnisharp",
		"gopls",
		"sqls",
		"terraformls",
    "jdtls"
	}

	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
		virtual_text = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(default_diagnostic_config)

	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({border = "rounded"})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({border = "rounded"})
	require("lspconfig.ui.windows").default_options.border = "rounded"

	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		opts.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

		local require_ok, settings = pcall(require, "eveloth.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup()
		end

		lspconfig[server].setup(opts)

		require("ionide").setup({
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		})
	end
end

return M
