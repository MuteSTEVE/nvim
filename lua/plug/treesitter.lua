local TREESITTER = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = "<cmd>TSUpdate",
}

function TREESITTER.config()
  local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not treesitter_ok then
    return
  end

  treesitter.setup({
    auto_install = true,
    ensure_installed = { "bash", "lua", "vim", "python", "markdown", "markdown_inline" },
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { "python", "css" },
    },
  })
end

return TREESITTER
