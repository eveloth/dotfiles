local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
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
		},
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		modules = {},
		ignore_install = {},
	})
end

return M
