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
    { import = "lsp" },
    { import = "plug" },
  },
  performance = {
    cache = { enabled = true },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
      disabled_plugins = {
        "editorconfig",
        "gzip",
        "man",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "nvim",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

local map = vim.keymap.set
local nrs = { noremap = true, silent = true }
map("n", "<A-l>", "<cmd>Lazy<CR>", nrs)
map("n", "<leader>g", function()
    require("lazy.util").float_term({ "lazygit" })
  end)
map("n", "<leader>lg", function()
    require("lazy.util").float_term({ "lazygit" })
  end)
map("n", "<leader>t", function()
    require("lazy.util").float_term({ "zsh" })
  end)
map("n", "<leader>ll", function()
    require("lazy.util").float_term({ "lazygit", "log" })
  end)
map("n", "<leader>r", function()
    require("lazy.util").float_term({ "ranger" })
  end)
map("n", "<leader>m", function()
    require("lazy.util").float_term({ "ncmpcpp" })
  end)
