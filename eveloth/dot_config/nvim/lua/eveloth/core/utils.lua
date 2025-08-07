-- filter which-key warnings
local orig_notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
	if msg:match("which%-key") and level == vim.log.levels.WARN then
		return
	end
	orig_notify(msg, level, opts)
end

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
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
