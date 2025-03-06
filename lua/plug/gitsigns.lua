local PLUG = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
  if not gitsigns_ok then
    return
  end
  gitsigns.setup({})
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end
  local IG = icons.git

  gitsigns.setup {
    signs = {
      add = { text = IG.signs },
      change = { text = IG.change },
      delete = { text = IG.delete },
      topdelete = { text = IG.topdelete },
      changedelete = { text = IG.changedelete },
    },
  }

  vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { silent = true })
end

return PLUG
