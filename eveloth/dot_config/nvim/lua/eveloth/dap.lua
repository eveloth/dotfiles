local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
}

M.config = function()
	local dap = require("dap")
	local ui = require("dapui")
	local wk = require("which-key")
	require("dap-go").setup()
	require("dapui").setup()

	dap.listeners.before.attach.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		ui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		ui.close()
	end

	wk.add({
		{ "<leader>d", group = "DAP" },
		{ "<leader>db", dap.toggle_breakpoint, desc = "Add breakpoint at line" },
		{ "<leader>du", ui.toggle, desc = "Open dap UI" },
		{ "<leader>de", ui.eval, desc = "Evaluate" },
		{ "<leader><F1>", dap.continue, desc = "Continue" },
	})
end

return M
