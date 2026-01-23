local M = {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
		"moyiz/blink-emoji.nvim",
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
			-- trigger = {
			-- 	show_in_snippet = false,
			-- },
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
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
			providers = {
				lsp = {
					-- make LSP top priority
					score_offset = 90,
					-- otherwise too many irrelevant matches
					-- max_items = 4,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- ..but lazydev even higher
					score_offset = 100,
				},

				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 10, -- Tune by preference
					opts = {
						insert = true, -- Insert emoji (default) or complete its name
						---@type string|table|fun():table
						trigger = function()
							return { ":" }
						end,
					},
					should_show_items = function()
						return vim.tbl_contains(
							-- Enable emoji completion only for git commits and markdown.
							-- By default, enabled for all file-types.
							{ "gitcommit", "markdown" },
							vim.o.filetype
						)
					end,
				},
			},
		},
		snippets = {
			preset = "default",
		},
	})
end

return M
