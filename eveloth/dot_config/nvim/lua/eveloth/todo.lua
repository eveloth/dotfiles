local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
}

M.config = function()
  local todo = require("todo-comments")
  todo.setup()

  local wk = require("which-key")
  wk.add({
    {"<leader>fw", "<cmd>TodoTelescope<cr>", decs = "Find TODOs"}
  })
end

return M
