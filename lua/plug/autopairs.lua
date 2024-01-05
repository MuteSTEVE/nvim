local PLUG = {
  'windwp/nvim-autopairs',
  event = "InsertEnter"
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
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  autopairs.setup {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
end

return PLUG
