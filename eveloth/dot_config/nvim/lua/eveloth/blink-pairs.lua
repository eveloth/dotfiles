local M = {
	"saghen/blink.pairs",
	version = "*", -- (recommended) only required with prebuilt binaries
	dependencies = "saghen/blink.download",
}

function M.config()
	--this all doesn't seem to work properly but I'm leaving it here
	local pairs = require("blink.pairs")

	---@module 'blink.pairs'
	---@class blink.pairs.Config
	opts = {
		mappings = {
			enabled = true,
			disabled_filetypes = { "snacks_picker_input" },
		},
		highlights = {
			enabled = true,
			priority = 99,
			-- In particular, these are unavailable through :Inscpect which is really stange
			groups = {
				"BlinkPairsOrange",
				"BlinkPairsPurple",
				"BlinkPairsBlue",
			},
			matchparen = {
				enabled = true,
			},
		},
	}

	pairs.setup(opts)
end

return M
