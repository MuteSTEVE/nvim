local PLUG = {
  'NvChad/nvim-colorizer.lua',
  ft = { "css", "js", "html" },
  event = { "BufReadPost", "BufNewFile" }
}

function PLUG.config()
  local colorizer_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_ok then
    return
  end

  colorizer.setup({})
end

return PLUG
