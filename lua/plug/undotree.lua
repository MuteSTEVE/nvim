local PLUG = {
  'jiaoshijie/undotree',
  keys = {
    { "<leader>u", function() require("undotree").toggle() end },
  },
}

function PLUG.config()
  local undotree_ok, undotree = pcall(require, "undotree")
  if not undotree_ok then
    return
  end

  undotree.setup({})
end

return PLUG
