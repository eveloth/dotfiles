local M = {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
}

function M.config()
	local wk = require("which-key")
	local lint = require("lint")

	lint.linters_by_ft = {
		go = { "golangcilint" },
	}

	local events = {
		"BufWritePost",
		"BufReadPost",
		"InsertLeave",
	}

	local groupName = "nvim-lint"
	local group = vim.api.nvim_create_augroup(groupName, { clear = true })
	vim.api.nvim_create_autocmd(events, {
		group = group,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.api.nvim_create_user_command("LintInfo", function()
		local filetype = vim.bo.filetype
		local linters = require("lint").linters_by_ft[filetype]

		if linters then
			print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
		else
			print("No linters configured for filetype: " .. filetype)
		end
	end, {})

	wk.add({
		"<leader>lc",
		function()
			lint.try_lint()
		end,
		desc = "Lint",
	})
end

return M
