local PLUG = {
  'williamboman/mason.nvim',
  lazy = true,
  dependencies = 'williamboman/mason-lspconfig.nvim',
  cmd = "Mason",
  keys = {
    { "<S-m>", "<cmd>Mason<CR>" }
  }
}

function PLUG.config()
  local mason_ok, mason = pcall(require, 'mason')
  if not mason_ok then
    return
  end
  local masonlsp_ok, masonlspconfig = pcall(require, 'mason-lspconfig')
  if not masonlsp_ok then
    return
  end

  local servers = {
    "pyright",
    "vimls",
    "lua_ls",
  }

  mason.setup({ PATH = "prepend" })
  masonlspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
  })
end

return PLUG
