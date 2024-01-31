local PLUG = {
  'akinsho/toggleterm.nvim',
  cmd = "ToggleTerm",
  keys = {
    { "<leader>m", "<cmd>lua Ncmpcpp()<CR>" },
    { "<leader>r", "<cmd>lua Ranger()<CR>" },
  }
}

function PLUG.config()
  local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
  if not toggleterm_ok then
    return
  end
  local Terminal  = require('toggleterm.terminal').Terminal

  toggleterm.setup({
    open_mapping = [[<A-f>]],
    start_in_insert = true,
    direction = 'float',
    float_opts = { border = "curved" }
  })

  -- Create a custom toggleterm window
  local ncmpcpp = Terminal:new({ cmd = "ncmpcpp", hidden = true })
  function Ncmpcpp() ncmpcpp:toggle() end

  local ranger = Terminal:new({ cmd = "ranger", hidden = true })
  function Ranger() ranger:toggle() end

  -- Escape terminal mode
  local map = vim.keymap.set
  local nr = { noremap = true, silent = true }
  map('t', '<leader>m', '<C-\\><C-n><cmd>q!<CR>', nr)
  map('t', '<leader>r', '<C-\\><C-n><cmd>q!<CR>', nr)
  map('t', '<leader>g', '<C-\\><C-n><cmd>q!<CR>', nr)

  -- Disable statusline in terminal mode with autocmd
  vim.cmd([[
    augroup statusline_terminal
    autocmd!
    autocmd TermEnter * set laststatus=0
    autocmd TermLeave * set laststatus=3
    augroup END
  ]])
end

return PLUG
