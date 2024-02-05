local PLUG = {
  'kylechui/nvim-surround',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local surround_ok, surround = pcall(require, "nvim-surround")
  if not surround_ok then
    return
  end

  surround.setup({})
end

return PLUG
