local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
  event ={ "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {}
}

M.config = function()
  require("todo-comments").setup()
end

return M
