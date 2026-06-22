---@brief
---
--- https://github.com/razzmatazz/csharp-language-server
---
--- Language Server for C#.
---
--- csharp-ls requires the [dotnet-sdk](https://dotnet.microsoft.com/download) to be installed.
---
--- The preferred way to install csharp-ls is with `dotnet tool install --global csharp-ls`.

local fs = vim.fs

---@type vim.lsp.Config
return {
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ "csharp-ls" }, dispatchers, {
			cwd = config.cmd_cwd or config.root_dir,
			env = config.cmd_env,
			detached = config.detached,
		})
	end,
	root_dir = function(bufnr, on_dir)
		local root = fs.root(bufnr, function(fname, _)
			return fname:match("%.sln$") ~= nil or fname:match("%.slnx$") ~= nil
		end)
		if not root then
			root = fs.root(bufnr, function(fname, _)
				return fname:match("%.csproj$") ~= nil
			end)
		end
		if root then
			on_dir(root)
		end
	end,
	filetypes = { "cs" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	capabilities = {
		experimental = {
			csharp = {
				metadataUris = true,
			},
		},
	},
	get_language_id = function(_, ft)
		if ft == "cs" then
			return "csharp"
		end
		return ft
	end,
}
