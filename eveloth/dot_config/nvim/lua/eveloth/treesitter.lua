local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"folke/which-key.nvim",
	},
	opts = {
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}

function M.config()
	require("nvim-treesitter").setup()

	local parsers = {
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
		"printf",
		"qmljs",
	}
	require("nvim-treesitter").install(parsers)

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local buf, filetype = args.buf, args.match

			local language = vim.treesitter.language.get_lang(filetype)
			if not language then
				return
			end

			-- check if parser exists and load it
			if not vim.treesitter.language.add(language) then
				return
			end

			-- enables syntax highlighting and other treesitter features
			vim.treesitter.start(buf, language)

			-- only enable treesitter indentation if indent queries exist for this language
			if vim.treesitter.query.get(language, "indents") then
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
	})

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

--local init = function()
--	local alreadyInstalled = require("nvim-treesitter.config").get_installed()
--	local parsersToInstall = vim.iter(ensureInstalled)
--		:filter(function(parser)
--			return not vim.tbl_contains(alreadyInstalled, parser)
--		end)
--		:totable()
--	require("nvim-treesitter").install(parsersToInstall)
--end
--
return M
