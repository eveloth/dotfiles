-- This initializes lazy plugin spec
require("eveloth.launch")

require("eveloth.core.options")
require("eveloth.core.keys")
require("eveloth.core.utils")

-- general
spec("eveloth.colorscheme")
spec("eveloth.mini")
spec("eveloth.whichkey")

-- files
spec("eveloth.oil")
spec("eveloth.nvimtree")
spec("eveloth.harpoon")
spec("eveloth.treesitter")
spec("eveloth.treesitter-context")

-- ui
spec("eveloth.lualine")
spec("eveloth.noice")
spec("eveloth.smear-cursor")
spec("eveloth.snacks")
spec("eveloth.illuminate")

-- code
spec("eveloth.lazydev")
spec("eveloth.mason")
spec("eveloth.dap")
spec("eveloth.blink-cmp")
spec("eveloth.blink-pairs")
spec("eveloth.neotest")
spec("eveloth.nvim-lint")
spec("eveloth.conform")
spec("eveloth.todo")
spec("eveloth.trouble")
spec("eveloth.gitsigns")
spec("eveloth.gonvim")
spec("eveloth.yuck")
--
-- Not that it did work in the first place and also it brings lspconfig with it
--spec("eveloth.ionide")
-- If you want to add another 3 minutes to your workflow and meditate
-- go ahead and enable this. This is extremely useful but extremely slow
--spec("eveloth.easydotnet")

-- install plugins
require("eveloth.plugins")

-- set hl groups
require("eveloth.core.colors")

-- configure lsp (prob should change the name)
require("eveloth.lspconfig")
