local PLUG = {
  'echasnovski/mini.nvim',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local mini_ok, mini = pcall(require, "mini.indentscope")
  if not mini_ok then
    return
  end

  mini.setup()
end

return PLUG
