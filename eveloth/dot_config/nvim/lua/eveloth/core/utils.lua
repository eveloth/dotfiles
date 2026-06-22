-- filter which-key warnings
local orig_notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
	if msg:match("which%-key") and level == vim.log.levels.WARN then
		return
	end
	orig_notify(msg, level, opts)
end

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- for gopass
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "/dev/shm/gopass*" },
	callback = function()
		vim.opt_local.swapfile = false
		vim.opt_local.backup = false
		vim.opt_local.undofile = false
		vim.opt_local.shada = ""
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = "*",
	callback = function()
		local clients = vim.lsp.get_clients({ name = "roslyn" })
		if not clients or #clients == 0 then
			return
		end

		local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
		local buffers = vim.lsp.get_buffers_by_client_id(ctx.client_id)
		for _, buf in ipairs(buffers) do
			local params = { textDocument = vim.lsp.util.make_text_document_params(buf) }
			client:request("textDocument/diagnostic", params, nil, buf)
		end
	end,
})
