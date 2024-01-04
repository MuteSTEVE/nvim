-- Map Leader key
vim.g.mapleader = ' '

-- Define map as keybind
local map = vim.api.nvim_set_keymap
local nr = { noremap = true, silent = false }
local nrs = { noremap = true, silent = true }

map('n', "<leader>w", "<cmd>w!<CR>", nr)
map('n', "<leader>q", "<cmd>q!<CR>", nr)
map('n', "<leader>h", "<cmd>noh<CR>", nrs)

-- Make executable files
map('x', "<leader>x", "<cmd>!chmod +x %<CR>", nrs)

-- Lazy and Mason
map("n", "<S-l>", "<cmd>Lazy<cr>", nrs)
map("n", "<S-m>", "<cmd>Mason<cr>", nrs)

-- Some useful keybinds VSCode move line keybind
map('n', 'K', "<cmd>move .-2<CR>==", nrs)
map('n', 'J', "<cmd>move .+1<CR>==", nrs)

-- buffer movement
map('n', 'Z', '<cmd>bp<CR>', nrs)
map('n', 'C', '<cmd>bn<CR>', nrs)
map('n', 'X', '<cmd>bd<CR>', nrs)

-- Move between panes
map('n', '<C-h>', '<C-w>h', nrs)
map('n', '<C-l>', '<C-w>l', nrs)
map('n', '<C-j>', '<C-w>j', nrs)
map('n', '<C-k>', '<C-w>k', nrs)

-- Indent
map('v', '<', '<gv', nrs)
map('v', '>', '>gv', nrs)

-- moving the cursor in insert mode
map('i', '<C-h>', '<Left>', nrs)
map('i', '<C-l>', '<Right>', nrs)

--|| Plugins keymaps || --
-- Telescope
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", nrs)
