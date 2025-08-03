local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"stevearc/conform.nvim",
			"folke/snacks.nvim",
		},
	},
}

local toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }))
end

local function set_keymap()
	local wk = require("which-key")
	local picker = require("snacks").picker
	local lsp = vim.lsp.buf
	local conform = require("conform")

	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>s", group = "Search..." },
		{ "g", group = "Go to..." },
		{ "gd", picker.lsp_definitions, desc = "Definitions" },
		{ "gi", picker.lsp_implementations, desc = "Implementations" },
		{ "gr", picker.lsp_references, desc = "References" },
		{ "K", lsp.hover, desc = "Hover" },
		{ mode = { "n", "v" }, { "<leader>la", lsp.code_action, desc = "Code Action" } },
		{ "<leader>lh", toggle_inlay_hints, desc = "Hints" },
		{
			"<leader>li",
			function()
				vim.cmd("LspInfo")
			end,
			desc = "Info",
		},
		{
			"<leader>lj",
			function()
				vim.diagnostic.jump({ count = 1 })
			end,
			desc = "Next Diagnostic",
		},
		{
			"<leader>lk",
			function()
				vim.diagnostic.jump({ count = -1 })
			end,
			desc = "Previous Diagnostic",
		},
		{ "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
		{ "<leader>lr", lsp.rename, desc = "Rename" },
		{ "<leader>ld", picker.diagnostics, desc = "Diagnosics" },
		{
			"<leader>ss",
			picker.lsp_symbols,
			desc = "Functions",
		},
		{
			"<leader>sf",
			function()
				picker.lsp_symbols({ filter = { "Function", "Method" } })
			end,
			desc = "Functions",
		},
		{
			"<leader>sr",

			function()
				picker.lsp_symbols({ filter = { "Struct", "Class", "Enum", "Interface", "Trait" } })
			end,
			desc = "Type definitions",
		},
		{
			"<leader>sv",
			function()
				picker.lsp_symbols({ filter = { "Variable", "Constant" } })
			end,
			desc = "Variables",
		},
		{ "<leader>rc", conform.format, desc = "Format" },
		{
			"<leader>rf",
			function()
				lsp.format({
					async = true,
					filter = function(client)
						return client.name ~= "typescript-tools"
					end,
				})
			end,
			desc = "Format (LSP-builtin)",
		},
	})
end

M.on_attach = function(client, _)
	set_keymap()

	-- Remove semantic tokens (doesn't seem to work, but I added it here not to forget later)
	client.server_capabilities.semanticTokenProvider = nil

	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true)
	end
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

function M.config()
	-- this overrides hover and it seems to be the only way to get it work consistently
	local hover = vim.lsp.buf.hover
	---@diagnostic disable-next-line: duplicate-set-field
	vim.lsp.buf.hover = function()
		hover({
			border = "rounded",
		})
	end

	local icons = require("eveloth.icons")

	local servers = {
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
		"roslyn_ls",
	}

	local default_diagnostic_config = {
		virtual_text = false,
		virtual_lines = false,
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
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

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" })

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

		vim.lsp.enable(server)
		vim.lsp.config[server] = opts

		require("ionide").setup({
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		})
	end
end

return M
