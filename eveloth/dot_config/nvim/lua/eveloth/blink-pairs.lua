local M = {
	"saghen/blink.pairs",
	version = "*", -- (recommended) only required with prebuilt binaries
	dependencies = "saghen/blink.download",
}

function M.config()
	local pairs = require("blink.pairs")

	---@module 'blink.pairs'
	---@class blink.pairs.Config
	opts = {
		mappings = {
			enabled = true,
			disabled_filetypes = { "snacks_picker_input", "markdown" },
		},
		highlights = {
			enabled = true,
			-- If less tresitter will override rainbow brackets
			priority = 101,
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
