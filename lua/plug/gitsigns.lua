local PLUG = {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPost", "BufNewFile" }
}

function PLUG.config()
  local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
  if not gitsigns_ok then
    return
  end
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end
  local GIT = icons.git

  gitsigns.setup {
    signs = {
      add = { hl = "GitSignsAdd", text = GIT.signs, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = GIT.signs, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = GIT.signs, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = GIT.signs, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = GIT.signs, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
  }
end

return PLUG
