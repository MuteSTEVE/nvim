local VSCODE = {
  'LunarVim/darkplus.nvim',
  lazy = false,
  priority = 1000
}


function VSCODE.config()
  vim.cmd("colorscheme darkplus")
end

return VSCODE
