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
map("n", "<A-l>", "<cmd>Lazy<CR>")
