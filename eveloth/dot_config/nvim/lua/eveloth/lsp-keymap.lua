---@class eveloth.LspKeymap
LspKeymap = {}
LspKeymap.__index = LspKeymap

local toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }))
end

local function lspInfo()
	vim.cmd("silent checkhealth vim.lsp")
end

local function lspRestart()
	vim.lsp.stop_client(vim.lsp.get_clients())
	vim.cmd.e()
end

local function lspStart()
	vim.cmd.e()
end

local function lspStop()
	vim.lsp.stop_client(vim.lsp.get_clients())
end

local function lspLog()
	vim.cmd.vsplit(vim.lsp.log.get_filename())
end

local function hover()
	return function()
		vim.lsp.buf.hover({ border = "rounded" })
	end
end

---@param n integer
---@return function
local function jump(n)
	return function()
		vim.diagnostic.jump({ count = n })
	end
end

---@param picker snacks.picker
---@param kinds string[]
---@return function
local function lsp_symbols(picker, kinds)
	return function()
		picker.lsp_symbols({ filter = { default = kinds } })
	end
end

---sets LSP keymap
---@diagnostic disable-next-line: duplicate-set-field -- chezmoi messes it 'cause of lazydev
function LspKeymap:set_keymap()
	local wk = require("which-key")
	local picker = require("snacks").picker
	local lsp = vim.lsp
	local buf = vim.lsp.buf
	local conform = require("conform")

	vim.api.nvim_create_user_command("LspStart", function()
		lspStart()
	end, { desc = "Starts LSP clients in the current buffer" })

	vim.api.nvim_create_user_command("LspStop", function()
		lspStop()
	end, {
		desc = "Stop all LSP clients",
	})

	vim.api.nvim_create_user_command("LspRestart", function()
		lspRestart()
	end, { desc = "Force-restarts all LSP clients" })

	vim.api.nvim_create_user_command("LspInfo", function()
		lspInfo()
	end, { desc = "Open attached LSP diagnostics" })

	vim.api.nvim_create_user_command("LspLog", function()
		lspLog()
	end, { desc = "Opens LSP log file in a verical split" })

	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>s", group = "Search..." },
		{ "g", group = "Go to..." },
		{ "gd", picker.lsp_definitions, desc = "Definitions" },
		{ "gi", picker.lsp_implementations, desc = "Implementations" },
		{ "gr", picker.lsp_references, desc = "References" },
		{ "K", hover(), desc = "Hover" },
		{ mode = { "n", "v" }, { "<leader>la", buf.code_action, desc = "Code Action" } },
		{ "<leader>lh", toggle_inlay_hints, desc = "Hints" },
		{ "<leader>li", lspInfo, desc = "Info" },
		{ "<leader>lj", jump(1), desc = "Next Diagnostic" },
		{ "<leader>lk", jump(-1), desc = "Previous Diagnostic" },
		{ "<leader>ll", lsp.codelens.run, desc = "CodeLens Action" },
		{ "<leader>lr", buf.rename, desc = "Rename" },
		{ "<leader>ld", picker.diagnostics, desc = "Diagnosics" },
		{ "<leader>ss", picker.lsp_symbols, desc = "Symbols" },
		{ "<leader>sf", lsp_symbols(picker, { "Function", "Method" }), desc = "Functions" },
		{ "<leader>sr", lsp_symbols(picker, { "Class, Struct, Interface, Trait" }), desc = "Type definitions" },
		{ "<leader>sv", lsp_symbols(picker, { "Variable", "Constant" }), desc = "Variables" },
		{ "<leader>rf", conform.format, desc = "Format (backwards compat)" },
	})
end

return LspKeymap
