-- Map Leader key
vim.g.mapleader = " "

-- Define map as keybind
local map = vim.keymap.set
local NR = { noremap = true, silent = false }
local NRS = { noremap = true, silent = true }

-- save, quit and no-highlight
map("n", "<leader>w", "<cmd>w!<CR>", NR)
map("n", "<leader>q", "<cmd>q!<CR>", NR)
map("n", "<A-q>", "<cmd>wq!<CR>", NR)
map("n", "<leader>h", "<cmd>noh | echo ' '<CR>", NRS)

-- Center highlight
map("n", "N", "Nzzzv", NRS)
map("n", "n", "nzzzv", NRS)

-- Make executable files
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", NRS)

-- Some useful VScode-keybinds to move a line
map("n", "<A-k>", "<cmd>move .-2<CR>==", NRS)
map("n", "<A-j>", "<cmd>move .+1<CR>==", NRS)
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", NRS)
map("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", NRS)

-- Buffer movement
map("n", "<S-z>", "<cmd>bp<CR>", NRS)
map("n", "<S-c>", "<cmd>bn<CR>", NRS)
map("n", "<S-x>", "<cmd>bd<CR>", NRS)
map("t", "<S-x>", "<cmd>bd!<CR>noh<CR>", NRS) -- Terminal mode

-- Jump between panes
map("n", "<C-h>", "<C-w>h", NRS)
map("n", "<C-j>", "<C-w>j", NRS)
map("n", "<C-l>", "<C-w>l", NRS)
map("n", "<C-k>", "<C-w>k", NRS)

-- Remap the redo ctrl+r it doesn't make any sense
map("n", "<S-u>", "<C-r>", NRS)

-- Indent
map("v", "<", "<gv", NRS)
map("v", ">", ">gv", NRS)

-- moving the cursor to left and right insert mode
map("i", "<A-h>", "<Left>", NRS)
map("i", "<A-l>", "<Right>", NRS)

-- use HJKL to cure your VScode cancer
map({ "i", "n" }, "<Left>", "<cmd>echo 'Use H VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Down>", "<cmd>echo 'Use J VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Up>", "<cmd>echo 'Use K VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Right>", "<cmd>echo 'Use L VScode user!'<CR>", NRS)

-- Fix mouse moving one character after exiting insert mode
map("i", "<Esc>", "<Esc>`^", NRS)
