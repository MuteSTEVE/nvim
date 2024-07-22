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
local float_term_ok, ft = pcall(require, "lazy.util")
local float_term = ft.float_term
if not float_term_ok then
  return
end

map("n", "<A-l>", "<cmd>Lazy<CR>")
map("n", "<leader>g", function()
    float_term("lazygit")
  end)
map("n", "<leader>lg", function()
    float_term("lazygit")
  end)
map("n", "<leader>ll", function()
    float_term({ "lazygit", "log" })
  end)
map("n", "<leader>r", function()
    float_term("ranger")
  end)
map("n", "<leader>m", function()
    float_term("ncmpcpp")
  end)
map("n", "<leader>t", function()
    float_term("bash")
  end)
