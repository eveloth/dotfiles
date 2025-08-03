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
