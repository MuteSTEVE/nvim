local PLUG = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

function PLUG.config()
  local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
  if not autopairs_ok then
    return
  end
  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok then
    return
  end
  local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
  if not cmp_autopairs_ok then
    return
  end

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  autopairs.setup({
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      chars = { "{", "[", "(", '"', "'" },
    },
  })
end

return PLUG
