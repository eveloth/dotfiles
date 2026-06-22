local M = {
	"Decodetalkers/csharpls-extended-lsp.nvim",
	ft = { "cs" },
}

function M.config()
	require("csharpls_extended").buf_read_cmd_bind()
end

return M
