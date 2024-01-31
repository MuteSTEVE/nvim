local VSCODE = {
  'LunarVim/darkplus.nvim',
  priority = 1000
}


function VSCODE.config()
  vim.cmd("colorscheme darkplus")
end

return VSCODE
