-- https://luals.github.io/wiki/settings/
return {
	settings = {
		Lua = {
			format = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim", "spec" },
			},
			runtime = {
				version = "LuaJIT",
				special = {
					spec = "require",
				},
			},
			hint = {
				enable = true,
				arrayIndex = "Auto", -- "Enable" | "Auto" | "Disable"
				await = true,
				paramName = "All", -- "All" | "Literal" | "Disable"
				paramType = true,
				semicolon = "All", -- "All" | "SameLine" | "Disable"
				setType = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
