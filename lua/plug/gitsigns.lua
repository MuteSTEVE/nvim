local GIT = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

function GIT.config()
  local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
  if not gitsigns_ok then
    return
  end
  local icons_ok, icons = pcall(require, "core.icons")
  if not icons_ok then
    return
  end
  local GT = icons.git

  gitsigns.setup({
    signs = {
      add = { text = GT.signs },
      change = { text = GT.signs },
      delete = { text = GT.signs },
      topdelete = { text = GT.signs },
      changedelete = { text = GT.signs },
    },
  })

  vim.keymap.set("n", "<A-g>", "<cmd>Gitsigns preview_hunk<CR>", { silent = true })
end

return GIT
