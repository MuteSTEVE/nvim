-- Map Leader key
vim.g.mapleader = " "

-- Define map as keybind
local map = vim.keymap.set
local nr = { noremap = true, silent = false }
local nrs = { noremap = true, silent = true }

-- save, quit and no highlight
map("n", "<leader>w", "<cmd>w!<CR>", nr)
map("n", "<leader>q", "<cmd>q!<CR>", nr)
map("n", "<A-q>", "<cmd>wq!<CR>", nr)
map("n", "<leader>h", "<cmd>noh | echo ' '<CR>", nrs)

-- Center highlight
map("n", "N", "Nzzzv", nrs)
map("n", "n", "nzzzv", nrs)

-- Make executable files
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", nrs)

-- Some useful keybinds VScode move line keybind
map("n", "K", "<cmd>move .-2<CR>==", nrs)
map("n", "J", "<cmd>move .+1<CR>==", nrs)
map("v", "J", "<cmd>m '>+1<CR>gv=gv", nrs)
map("v", "K", "<cmd>m '<-2<CR>gv=gv", nrs)

-- buffer movement
map("n", "Z", "<cmd>bp<CR>", nrs)
map("n", "C", "<cmd>bn<CR>", nrs)
map("n", "X", "<cmd>bd<CR>", nrs)

-- Move between panes
map("n", "<C-h>", "<C-w>h", nrs)
map("n", "<C-l>", "<C-w>l", nrs)
map("n", "<C-j>", "<C-w>j", nrs)
map("n", "<C-k>", "<C-w>k", nrs)

-- remap ctrl+r it doesn't make any sense!
map("n", "r", "<C-r>", nrs)

-- Indent
map("v", "<", "<gv", nrs)
map("v", ">", ">gv", nrs)

-- moving the cursor in insert mode
map("i", "<C-h>", "<Left>", nrs)
map("i", "<C-l>", "<Right>", nrs)

-- use HJKL to cure your VScode cancer
map({ "i", "n" }, "<Left>", "<cmd>echo 'Use H VScode user!'<CR>", nrs)
map({ "i", "n" }, "<Down>", "<cmd>echo 'Use J VScode user!'<CR>", nrs)
map({ "i", "n" }, "<Up>", "<cmd>echo 'Use K VScode user!'<CR>", nrs)
map({ "i", "n" }, "<Right>", "<cmd>echo 'Use L VScode user!'<CR>", nrs)

-- Automatically close brackets, parethesis, and quotes
map("i", [[']], [[''<Left>]])
map("i", [["]], [[""<left>]])
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
