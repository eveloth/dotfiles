return {
	cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
	handlers = {
		["textDocument/definition"] = function(...)
			return require("omnisharp_extended").handler(...)
		end,
	},
  keys = {
    "gd",
    function ()
      require("omnisharp_extended").telescope_lsp_definitions()
    end,
    desc = "Go to definition",
  },

	enable_roslyn_analyzers = true,
	organize_imports_on_format = true,
	enable_import_completion = true,
}
