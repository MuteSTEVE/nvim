-- Disable statusline in terminal mode with autocmd
vim.cmd([[
  augroup statusline_terminal
    autocmd!
    autocmd TermEnter * set laststatus=0
    autocmd TermLeave * set laststatus=3
  augroup END
]])

-- Remove trailing_space on lua and python file
vim.cmd([[
  augroup trailing_space
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.lua :%s/\s\+$//e
  augroup END
]])
