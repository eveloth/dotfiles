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
      "toml"
		},
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return M
