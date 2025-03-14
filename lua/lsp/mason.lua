local PLUG = {
  "williamboman/mason.nvim",
  dependencies =  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = { "<A-m>", "<cmd>Mason<CR>" },
  cmd = "Mason",
}

function PLUG.config()
  local mason_ok, mason = pcall(require, "mason")
  if not mason_ok then
    return
  end
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_ok then
    return
  end

  mason.setup()
  mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
      "bashls",
      "clangd",
      "emmet_language_server",
      "lua_ls",
      "marksman",
      "pyright",
      "vimls",
    },
  })
end

return PLUG
