local M = {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons", opts = {} },
}

function M.config()
	local wk = require("which-key")
	wk.add({
		{ "<leader>ef", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
	})

	require("nvim-tree").setup({
		hijack_netrw = false,
		sync_root_with_cwd = false,
		view = {
			relativenumber = true,
		},
		renderer = {
			add_trailing = false,
			group_empty = false,
			highlight_git = false,
			full_name = false,
			highlight_opened_files = "none",
			root_folder_label = ":t",
			indent_width = 2,
			indent_markers = {
				enable = false,
				inline_arrows = true,
			},
			icons = {
				git_placement = "before",
				padding = " ",
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			symlink_destination = true,
		},
		update_focused_file = {
			enable = true,
			debounce_delay = 15,
			update_root = true,
			ignore_list = {},
		},

		diagnostics = {
			enable = true,
			show_on_dirs = false,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = {
				min = vim.diagnostic.severity.WARN,
				max = vim.diagnostic.severity.ERROR,
			},
			icons = {
				warning = " ",
				error = " ",
			},
		},
	})
end

return M
