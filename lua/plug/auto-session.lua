local PLUG = {
  'rmagatti/auto-session',
}

function PLUG.config()
  local auto_sesion_ok, auto_session = pcall(require, "auto-session")
  if not auto_sesion_ok then
    return
  end
  auto_session.setup({})
end

return PLUG
