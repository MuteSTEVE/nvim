local map = vim.keymap.set
local NRS = { noremap = true, silent = true }

-- Buffer movement
map("t", "<A-[>", "<C-\\><C-n><cmd>bp<CR>{}k$<CR>", NRS)
map("t", "<A-]>", "<C-\\><C-n><cmd>bn<CR>{}k$<CR>", NRS)
map("t", "<A-\\>", "<C-\\><C-n><cmd>bd!<CR>noh<CR>", NRS)
map("t", "<S-Esc>", "<C-\\><C-n><CR>", NRS)

-- Jump between panes
map("t", "<C-h>", "<C-\\><C-n><C-w>h<CR>{}k$", NRS)
map("t", "<C-j>", "<C-\\><C-n><C-w>j<CR>{}k$", NRS)
map("t", "<C-k>", "<C-\\><C-n><C-w>k<CR>{}k$", NRS)
map("t", "<C-l>", "<C-\\><C-n><C-w>l<CR>{}k$", NRS)

-- Neovim builtin-terminal
map("n", "<leader>tj", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 13)
end)
map("n", "<leader>tk", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, 50)
end)
map("n", "<leader>tt", function ()
  vim.cmd.term()
end)
