local PLUG = {
  'kelly-lin/ranger.nvim',
  keys = {
    { "<leader>r", function() require("ranger-nvim").open(true) end}
  }
}

function PLUG.config()
  local ranger_ok, ranger = pcall(require, "ranger-nvim")
  if not ranger_ok then
    return
  end

  ranger.setup({ replace_netrw = true })
end

return PLUG
