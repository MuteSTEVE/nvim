local PLUG = {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
}

function PLUG.config()
  local rose_pine_ok, rose_pine = pcall(require, "rose-pine")
  if not rose_pine_ok then
    return
  end

  rose_pine.setup({
    dark_variant = "main", -- main, moon, or dawn
    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },
  })

  vim.cmd("colorscheme rose-pine")
end

return PLUG
