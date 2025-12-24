local opt = vim.opt

opt.shell = "/bin/zsh"

-- BASE
opt.number = true
opt.relativenumber = true
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8 -- how many lines to show when scrolling to the end of visible buffer
opt.sidescrolloff = 8
opt.cursorline = true

-- TABS
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again
opt.autoindent = true
opt.showtabline = 1

-- SEARCH
opt.ignorecase = true
opt.smartcase = true -- if I, however, use capitals, take that into account
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.updatetime = 300 -- faster completion (4000ms default)

-- NETRW
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

-- VISUALS
opt.termguicolors = true
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.showmatch = true
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
opt.cmdheight = 1
opt.numberwidth = 2
opt.showmode = false
opt.colorcolumn = "120,121"

-- FILE HANDLING
opt.backup = false
opt.swapfile = false
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
opt.autoread = true -- read file if modified externally
opt.autowrite = false --don't autosave

-- MISC
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.iskeyword:append("-")
opt.path:append("**")
opt.encoding = "UTF-8"
vim.cmd("set whichwrap+=<,>,[,],h,l") -- this will allow both arrows and h and l to go to the previous line etc.

--SPLITS
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

vim.cmd([[set iskeyword+=-]]) -- this will treat words like 'lua-binds' like a word (w) not (W)

vim.filetype.add({
	pattern = { [".*/hypr/.*.conf"] = "hyprlang" },
	extension = { use = "use" },
})
