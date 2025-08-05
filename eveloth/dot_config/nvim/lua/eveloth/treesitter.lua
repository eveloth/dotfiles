local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"folke/which-key.nvim",
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"c_sharp",
			"ocaml",
			"c",
			"go",
			"terraform",
			"hcl",
			"ruby",
			"toml",
			"json",
			"gomod",
			"sql",
			"hyprlang",
			"asm",
			"cmake",
			"desktop",
			"fsharp",
			"git_config",
			"gitignore",
			"html",
			"nasm",
			"nginx",
			"proto",
			"rasi",
			"rust",
			"ssh_config",
			"svelte",
			"vim",
			"yuck",
			"regex",
		},
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		modules = {},
		ignore_install = {},
	})

	local parsers = require("nvim-treesitter.parsers").get_parser_configs()

	-- This should be my first plugin!!
	-- Highlight groups are being reset after colorscheme applies;
	-- this means that these groups should either be set after that or with
	-- an autocommand
	---@diagnostic disable-next-line: inject-field
	parsers.use = {
		install_info = {
			url = "~/repos/gentoo/tree-sitter-use/",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetypes = "use",
	}

	vim.treesitter.language.register("use", "use")

	local wk = require("which-key")
	wk.add({
		{
			"<leader>i",
			function()
				vim.cmd("Inspect")
			end,
			desc = "Inspect",
		},
	})
end
return M
