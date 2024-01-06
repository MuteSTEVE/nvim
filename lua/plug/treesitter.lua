local PLUG = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function PLUG.config()
  local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not treesitter_ok then
    return
  end

  treesitter.setup {
    auto_install = true,
    ensure_installed = { "bash", "c", "html", "php", "css", "javascript", "lua", "vim", "python" },
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = {
        "python", "css"
      }
    }
  }
end

return PLUG
