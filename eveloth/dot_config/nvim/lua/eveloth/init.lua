-- filter which-key warnings
local orig_notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
  if msg:match("which%-key") and level == vim.log.levels.WARN then
    return
  end
  orig_notify(msg, level, opts)
end

require("eveloth.launch")
require("eveloth.options")
require("eveloth.keys")

-- general
spec("eveloth.colorscheme")
spec("eveloth.devicons")
spec("eveloth.treesitter")
spec("eveloth.treesitter-context")
spec("eveloth.harpoon")
spec("eveloth.whichkey")
spec("eveloth.telescope")
spec("eveloth.nvimtree")
spec("eveloth.fzf")
spec("eveloth.mini")

-- ui
spec("eveloth.lualine")
spec("eveloth.dressing")
spec("eveloth.noice")
spec("eveloth.toggleterm")
spec("eveloth.smear-cursor")

-- code
spec("eveloth.lspconfig")
spec("eveloth.mason")
spec("eveloth.neotest")
spec("eveloth.cmp")
spec("eveloth.yuck")
spec("eveloth.none-ls")
spec("eveloth.conform")
spec("eveloth.comment")
spec("eveloth.autopairs")
spec("eveloth.illuminate")
spec("eveloth.omnisharp-ext")
spec("eveloth.ionide")
spec("eveloth.gonvim")
spec("eveloth.todo")
spec("eveloth.dap")
spec("eveloth.trouble")
spec("eveloth.nvim-lint")
spec("eveloth.roslyn")

-- plugins
require("eveloth.plugins")
require("eveloth.colors")
