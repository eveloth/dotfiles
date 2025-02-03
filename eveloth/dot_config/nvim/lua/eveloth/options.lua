opt = vim.opt

opt.backup = false

opt.shell = "/bin/zsh"

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.pumheight = 10 -- pop up menu height
opt.showmode = false
opt.swapfile = false
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages

opt.numberwidth = 2
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

opt.cmdheight = 1

-- TABS
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again
opt.showtabline = 1

--SPLITS
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

opt.smartcase = true -- smart case
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.wrap = false -- display lines as one long line

opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.updatetime = 300 -- faster completion (4000ms default)

opt.pumheight = 10
opt.pumblend = 10

vim.cmd([[set iskeyword+=-]]) -- this will treat words like 'lua-binds' like a word (w) not (W)

vim.cmd("set whichwrap+=<,>,[,],h,l") -- this will allow both arrows and h and l to go to the previous line etc.

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
