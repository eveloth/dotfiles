local M = {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	version = "1.*",
	opts = {},
	opts_extend = { "sources.default" },
}

M.config = function()
	require("blink-cmp").setup({
		enabled = function()
			local ft = vim.bo[0].filetype
			return not (ft == "snacks_picker_input")
		end,
		keymap = {
			preset = "default",
		},
		cmdline = {
			enabled = true,
		},
		completion = {
			menu = {
				auto_show = true,
				border = "rounded",
			},
			documentation = {
				auto_show = false,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				show_with_selection = true,
				show_without_menu = true,
				show_without_selection = true,
				show_with_menu = false,
				enabled = true,
			},
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					-- make LSP top priority
					score_offset = 90,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- ..but lazydev even higher
					score_offset = 100,
				},
			},
		},
	})
end

return M
