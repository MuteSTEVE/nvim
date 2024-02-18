local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then
	return
end

lazy.setup({
	spec = {
		{ import = "plug" },
		{ import = "lsp" },
	},
	performance = {
		cache = { enabled = true },
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			disabled_plugins = {
				"gzip",
				"nvim",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"spellfile",
				"editorconfig",
			},
		},
	},
})

local map = vim.keymap.set
local nrs = { noremap = true, silent = true }
map("n", "<S-l>", "<cmd>Lazy<CR>", nrs)
map("n", "<leader>g", function()
	require("lazy.util").float_term({ "lazygit" })
end, nrs)
map("n", "<leader>t", function()
	require("lazy.util").float_term({ "zsh" })
end, nrs)
map("n", "<leader>l", function()
	require("lazy.util").float_term({ "lazygit", "log" })
end, nrs)
map("n", "<leader>r", function()
	require("lazy.util").float_term({ "ranger" })
end, nrs)
map("n", "<leader>m", function()
	require("lazy.util").float_term({ "ncmpcpp" })
end, nrs)
