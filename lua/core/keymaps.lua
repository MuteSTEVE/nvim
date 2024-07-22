-- Map Leader key
vim.g.mapleader = " "

-- Define map as keybind
local map = vim.keymap.set
local NR = { noremap = true, silent = false }
local NRS = { noremap = true, silent = true }

-- save, quit and no highlight
map("n", "<leader>w", "<cmd>w!<CR>", NR)
map("n", "<leader>q", "<cmd>q!<CR>", NR)
map("n", "<A-q>", "<cmd>wq!<CR>", NR)
map("n", "<leader>h", "<cmd>noh | echo ' '<CR>", NRS)

-- Force write as sudo
map("c", "w!!", "w !sudo tee > /dev/null %", NRS)

-- Center highlight
map("n", "N", "Nzzzv", NRS)
map("n", "n", "nzzzv", NRS)

-- Make executable files
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", NRS)

-- Some useful keybinds VScode move line keybind
map("n", "K", "<cmd>move .-2<CR>==", NRS)
map("n", "J", "<cmd>move .+1<CR>==", NRS)
map("v", "J", "<cmd>m '>+1<CR>gv=gv", NRS)
map("v", "K", "<cmd>m '<-2<CR>gv=gv", NRS)

-- buffer movement
map("n", "Z", "<cmd>bp<CR>", NRS)
map("n", "C", "<cmd>bn<CR>", NRS)
map("n", "X", "<cmd>bd<CR>", NRS)

-- Move between panes
map("n", "<C-h>", "<C-w>h", NRS)
map("n", "<C-l>", "<C-w>l", NRS)
map("n", "<C-j>", "<C-w>j", NRS)
map("n", "<C-k>", "<C-w>k", NRS)

-- remap the redo ctrl+r it doesn't make any sense!
map("n", "<S-u>", "<C-r>", NRS)

-- Indent
map("v", "<", "<gv", NRS)
map("v", ">", ">gv", NRS)

-- moving the cursor to left and right insert mode
map("i", "<C-h>", "<Left>", NRS)
map("i", "<C-l>", "<Right>", NRS)

-- use HJKL to cure your VScode cancer
map({ "i", "n" }, "<Left>", "<cmd>echo 'Use H VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Down>", "<cmd>echo 'Use J VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Up>", "<cmd>echo 'Use K VScode user!'<CR>", NRS)
map({ "i", "n" }, "<Right>", "<cmd>echo 'Use L VScode user!'<CR>", NRS)

-- Close brackets, parethesis, and quotes insert mode
map("i", [[']], [[''<Left>]], NRS)
map("i", [["]], [[""<left>]], NRS)
map("i", "(", "()<left>", NRS)
map("i", "[", "[]<left>", NRS)
map("i", "{", "{}<left>", NRS)

-- Change spellang, en_us and id_id
map("n", "<leader>en", "<cmd>set spelllang=en | echo 'Using English spell language'<CR>", NRS)
map("n", "<leader>id", "<cmd>set spelllang=id | echo 'Using Indonesia spell language'<CR>", NRS)
