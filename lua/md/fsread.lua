local FSREAD = {
  "nullchilly/fsread.nvim",
  ft = "markdown",
  cmd = { "FSRead", "FSClear", "FSToggle" },
  keys = { { "<C-r>", "<cmd>FSToggle<CR>" } }
}

function FSREAD.config()
  vim.g.flow_strength = 0.7 -- low: 0.3, middle: 0.5, high: 0.7 (default)
  vim.api.nvim_set_hl(0, "FSSuffix", { fg = "#63636E" })
  vim.api.nvim_set_hl(0, "FSPrefix", { fg = "white" })
  vim.keymap.set("n", "<C-r>", "<cmd>FSToggle<CR>", {})
end

return FSREAD
