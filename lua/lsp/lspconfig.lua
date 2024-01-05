local PLUG = {
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end
  local IS = icons.signs

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local language_servers = lspconfig.util.available_servers()
  for _, ls in ipairs(language_servers) do
    lspconfig[ls].setup({
      capabilities = capabilities,
    })
  end

  local langservers = {
    "cssls",
    "cssmodules_ls",
    "unocss",
    "emmet_language_server",
    "emmet_ls",
    "html",
    "jedi_language_server",
    "pyre",
    "pyright",
    "pylyzer",
    "sourcery",
    "pylsp",
    "ruff_lsp",
    "vimls",
    "lua_ls",
  }

  for _, server in ipairs(langservers) do
    lspconfig[server].setup {
      capabilities = capabilities,
    }
  end

  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  }

  local signs = { Error = IS.Error, Warn = IS.Warn, Hint = IS.Hint, Info = IS.Info }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return PLUG
