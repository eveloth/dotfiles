local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  local mark = require('harpoon.mark')
  local ui = require('harpoon.ui')

  keymap('n', "<leader>a", mark.add_file)
  keymap('n', "<C-h>", ui.toggle_quick_menu)
  keymap('n', "<leader>1", function() ui.nav_file(1) end, opts)
  keymap('n', "<leader>2", function() ui.nav_file(2) end, opts)
  keymap('n', "<leader>3", function() ui.nav_file(3) end, opts)
  keymap('n', "<leader>4", function() ui.nav_file(4) end, opts)
end

return M
