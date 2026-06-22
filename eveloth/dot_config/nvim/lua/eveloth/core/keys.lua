local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = ";"

keymap("i", "jk", "<ESC>", opts)
-- Reset space, I don't remember why
keymap("n", "<Space>", "", opts)

-- Better move around windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers with alt tab
keymap("n", "<m-tab>", "<c-6>", opts)

-- Move lines up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- When you copy keep the first buffer
keymap("v", "p", '"_dP', opts)
keymap("x", "p", [["_dP]])

-- Go to the begging and to the end easily
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Drop selection
keymap({ "n", "o", "x" }, "<C-/>", ":noh<CR>", opts)

keymap("n", "<leader>yr", function()
	vim.fn.setreg("+", vim.fn.expand("%:p:."))
	vim.notify("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "Copy current buffer relative path" })

keymap("n", "<leader>rr", function()
	local ref = vim.fn.expand("%:p:.") .. ":" .. vim.fn.line(".")
	vim.fn.setreg("+", ref)
	vim.notify("Copied: " .. ref)
end, { desc = "Copy file:line reference" })

keymap("n", "<leader>re", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1] - 1
	local col = cursor[2]
	local file_ref = vim.fn.expand("%:p:.") .. ":" .. (line + 1)

	local function in_range(range)
		if line < range.start.line or line > range["end"].line then return false end
		if line == range.start.line and col < range.start.character then return false end
		if line == range["end"].line and col > range["end"].character then return false end
		return true
	end

	local function find_path(symbols)
		local path = {}
		local function walk(syms)
			for _, sym in ipairs(syms) do
				local range = sym.range or (sym.location and sym.location.range)
				if range and in_range(range) then
					table.insert(path, sym.name)
					if sym.children then walk(sym.children) end
					return
				end
			end
		end
		walk(symbols)
		return path
	end

	vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", {
		textDocument = { uri = vim.uri_from_bufnr(bufnr) },
	}, function(err, result)
		local ref
		if err or not result or #result == 0 then
			ref = file_ref
		else
			local path = find_path(result)
			ref = #path > 0 and (file_ref .. " — " .. table.concat(path, " > ")) or file_ref
		end
		vim.fn.setreg("+", ref)
		vim.notify("Copied: " .. ref)
	end)
end, { desc = "Copy file:line — LSP symbol reference" })

keymap("n", "<leader>rl", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1] - 1
	local col = cursor[2]

	local function in_range(range)
		if line < range.start.line or line > range["end"].line then return false end
		if line == range.start.line and col < range.start.character then return false end
		if line == range["end"].line and col > range["end"].character then return false end
		return true
	end

	local function find_path(symbols)
		local path = {}
		local function walk(syms)
			for _, sym in ipairs(syms) do
				local range = sym.range or (sym.location and sym.location.range)
				if range and in_range(range) then
					table.insert(path, sym.name)
					if sym.children then walk(sym.children) end
					return
				end
			end
		end
		walk(symbols)
		return path
	end

	vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", {
		textDocument = { uri = vim.uri_from_bufnr(bufnr) },
	}, function(err, result)
		if err or not result or #result == 0 then
			vim.notify("No LSP symbols", vim.log.levels.WARN)
			return
		end
		local path = find_path(result)
		if #path == 0 then
			vim.notify("No symbol at cursor", vim.log.levels.WARN)
			return
		end
		local ref = table.concat(path, " > ")
		vim.fn.setreg("+", ref)
		vim.notify("Copied: " .. ref)
	end)
end, { desc = "Copy LSP symbol reference" })
