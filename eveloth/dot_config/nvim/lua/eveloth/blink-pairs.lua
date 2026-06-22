local M = {
	"saghen/blink.pairs",
	dependencies = "saghen/blink.lib",

	version = "*",
	-- download prebuilt binaries from github releases, must be on a versioned release
	build = function()
		require("blink.pairs").download():pwait(60000)
	end,
	"saghen/blink.pairs",
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
