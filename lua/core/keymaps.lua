-- Map Leader key
vim.g.mapleader = ' '

-- Define map as keybind
local map = vim.api.nvim_set_keymap
local nrs = { noremap = true, silent = false }
local nr = { noremap = true, silent = true }

-- Lazy and Mason
map("n", "<S-l>", "<cmd>Lazy<cr>", nr)
map("n", "<S-m>", "<cmd>Mason<cr>", nr)

-- Some useful keybinds VSCode move line keybind
map('n', 'K', "<cmd>move .-2<CR>==", nr)
map('n', 'J', "<cmd>move .+1<CR>==", nr)

-- buffer movement
map('n', 'Z', '<cmd>bp<CR>', nr)
map('n', 'C', '<cmd>bn<CR>', nr)
map('n', 'X', '<cmd>bd<CR>', nr)

-- Move between panes
map('n', '<C-h>', '<C-w>h', nrs)
map('n', '<C-l>', '<C-w>l', nrs)
map('n', '<C-j>', '<C-w>j', nrs)
map('n', '<C-k>', '<C-w>k', nrs)

-- Indent
map('v', '<', '<gv', nrs)
map('v', '>', '>gv', nrs)

-- moving the cursor in insert mode
map('i', '<C-h>', '<Left>', nr)
map('i', '<C-l>', '<Right>', nr)
