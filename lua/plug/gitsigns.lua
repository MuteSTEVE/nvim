local GIT = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

function GIT.config()
  local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
  if not gitsigns_ok then
    return
  end
  gitsigns.setup({})

  vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { silent = true })
end

return GIT
