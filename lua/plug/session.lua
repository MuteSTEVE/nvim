return {
  'rmagatti/auto-session',
  config = function()
    local auto_sesion_ok, auto_session = pcall(require, "auto-session")
    if not auto_sesion_ok then
      return
    end
    auto_session.setup ({})
  end
}
