local M = {
	"saghen/blink.pairs",
	version = "*", -- (recommended) only required with prebuilt binaries
	dependencies = "saghen/blink.download",

	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		mappings = {
			-- you can call require("blink.pairs.mappings").enable()
			-- and require("blink.pairs.mappings").disable()
			-- to enable/disable mappings at runtime
			enabled = true,
			cmdline = true,
			-- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
			-- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
			disabled_filetypes = { "TelescopePrompt" },
			-- see the defaults:
			-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
			pairs = {},
		},
		highlights = {
			enabled = true,
			-- requires require('vim._extui').enable({}), otherwise has no effect
			cmdline = true,
			groups = {
				"BlinkPairsOrange",
				"BlinkPairsPurple",
				"BlinkPairsBlue",
			},
			unmatched_group = "BlinkPairsUnmatched",

			-- highlights matching pairs under the cursor
			matchparen = {
				enabled = true,
				-- known issue where typing won't update matchparen highlight, disabled by default
				cmdline = false,
				group = "MatchParen",
			},
		},
		debug = true,
	},
}

function M.config()
	local pairs = require("blink.pairs")

	pairs.setup({})
end

return M
