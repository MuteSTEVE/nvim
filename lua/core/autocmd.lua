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
autocmd("TermClose", {
  group = "TerminalMode",
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

-- Auto-indent and remove trailing white spaces
augroup("FileFormat", clear)
autocmd("BufWritePre", {
  group = "FileFormat",
  pattern = { "*.py", "*.lua" },
  callback = function()
    vim.cmd("normal mMgg=G'M")
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- Highlight yank
augroup("CustomBuffer", clear)
autocmd("TextYankPost", {
  group = "CustomBuffer",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})
