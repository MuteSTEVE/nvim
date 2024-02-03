-- Local autogroup & autocmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local clear = { clear = true }

-- Disable statusline in terminal mode with autocmd
augroup("statusline_terminal", clear)
autocmd(
  "TermEnter", {
    group = "statusline_terminal",
    pattern = "*",
    command = "set laststatus=0"
  }
)
autocmd(
  "TermLeave", {
    group = "statusline_terminal",
    pattern = "*",
    command = "set laststatus=3"
  }
)

-- Auto-indent html, php and javascript files
augroup("autoindent", clear)
autocmd(
  "BufWritePre", {
    group = "autoindent",
    pattern = { "*.html", "*.php", "*.js"},
    command = "normal mMgg=G'M"
  }
)

-- Remove trailing_space on lua and python file
augroup("trailing_space", clear)
autocmd(
  "BufWritePre", {
    group = "trailing_space",
    pattern = { "*.py", "*.lua"},
    command = [[%s/\s\+$//e]]
  }
)
