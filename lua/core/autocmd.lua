-- Local augroup & autocmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local clear = { clear = true }

-- conform.nvim plugin
local conform_ok, conform = pcall(require, "conform")
if not conform_ok then
	return
end

-- TerminalMode
-- Disable statusline in terminal mode
augroup("TerminalMode", clear)
autocmd("TermEnter", {
	group = "TerminalMode",
	pattern = "*",
	command = "set laststatus=0",
})
autocmd("TermLeave", {
	group = "TerminalMode",
	pattern = "*",
	command = "set laststatus=3",
})
-- Always start terminal in insert mode
autocmd("TermOpen", {
	group = "TerminalMode",
	pattern = "*",
	command = "startinsert | set winfixheight",
})
-- Remove line and relative number
autocmd("TermOpen", {
	group = "TerminalMode",
	pattern = "*",
	command = "set nonumber | set norelativenumber",
})
autocmd("TermClose", {
	group = "TerminalMode",
	pattern = "*",
	command = "set number | set relativenumber",
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
-- require conform.nvim plugin
autocmd("BufWritePost", {
	group = "CustomBuffer",
	pattern = { "c", "cpp", "lua", "python", "css", "javascript", "html" },
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})
