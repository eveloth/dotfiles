local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = ";"

keymap("i", "jk", "<ESC>", opts)
-- Reset space, I don't remember why
keymap("n", "<Space>", "", opts)

-- Better move around windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers with alt tab
keymap("n", "<m-tab>", "<c-6>", opts)

-- Move lines up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- When you copy keep the first buffer
keymap("v", "p", '"_dP', opts)
keymap("x", "p", [["_dP]])

-- Go to the begging and to the end easily
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Drop selection
keymap({ "n", "o", "x" }, "<C-_>", ":noh<CR>", opts)

