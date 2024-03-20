local LUA = {
  "hrsh7th/cmp-nvim-lua",
  ft = "lua"
}

function LUA.config()
  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok then
    return
  end

  cmp.setup({
    sources = {
      { name = 'nvim_lua' }
    }
  })
end

return LUA
