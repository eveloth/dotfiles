local M = {
	"folke/snacks.nvim",
	dependencies = {
		"folke/which-key.nvim",
	},
}

---@param snacks Snacks
local function toggleTerminal(snacks)
	return function()
		---@class snacks.terminal.Opts
		local opts = {
			env = {
				["SKIP_COMLETIONS"] = "true",
				["SKIP_PFETCH"] = "true",
			},
			win = {
				border = "rounded",
				position = "float",
			},
		}
		snacks.terminal.toggle(nil, opts)
	end
end

---@class snacks.picker.Config
local pickerConfig = {
	ui_select = true,
	matcher = {
		frecency = true, -- freq bonus
	},
}

function M.config()
	local snacks = require("snacks")
	snacks.setup({
		image = { enabled = true },
		indent = { enabled = true },
		input = {
			enabled = true,
			win = { style = "input", position = "float" },
			prompt_pos = "left",
		},
		lazygit = {
			win = {
				border = "rounded",
			},
		},
		picker = pickerConfig,
		-- I should research on how to make this fast enough, this doesn't work
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 13, total = 175 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 10, -- delay in ms before using the repeat animation
				duration = { step = 3, total = 30 },
				easing = "linear",
			},
			-- what buffers to animate
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
	})

	local wk = require("which-key")

	wk.add({
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle scratch",
		},
		{ "<leader>f", group = "Find..." },
		{ "<leader>ff", snacks.picker.files, desc = "Files" },
		{ "<leader>fs", Snacks.scratch.select, desc = "Scratches" },
		{ "<leader>ft", snacks.picker.grep, desc = "Grep" },
		{ "<leader>fc", snacks.picker.colorschemes, desc = "Colorschemes" },
		{ "<leader>fb", snacks.picker.git_branches, desc = "Git branches" },
		{ "<leader>bb", snacks.picker.buffers, desc = "Buffers" },
		{ "<leader>fr", snacks.picker.resume, desc = "Last picker" },
		{ "<leader>fh", snacks.picker.help, desc = "Help" },
		{ "<leader>t", group = "Terminal..." },
		{
			"<leader>tl",
			function()
				snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{ "<c-\\>", toggleTerminal(snacks), mode = { "n", "v", "t" }, desc = "Floating" },
	})
end

return M
