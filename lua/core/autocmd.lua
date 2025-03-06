-- Local augroup & autocmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local clear = { clear = true }

-- TerminalMode
augroup("TerminalMode", clear)
autocmd("TermOpen", {
  group = "TerminalMode",
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- FileFormat
-- Auto-indent html, php and javascript files
augroup("FileFormat", clear)
autocmd("BufWritePre", {
  group = "FileFormat",
  pattern = { "*.html", "*.php", "*.js" },
  command = "normal mMgg=G'M",
})
-- Remove trailing space
autocmd("BufWritePre", {
  group = "FileFormat",
  pattern = { "*.py", "*.lua" },
  command = [[%s/\s\+$//e]],
})

-- Custom Buffer
-- Highlight yank
augroup("CustomBuffer", clear)
autocmd("TextYankPost", {
  group = "CustomBuffer",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})
