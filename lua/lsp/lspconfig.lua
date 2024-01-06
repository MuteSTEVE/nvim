local PLUG = {
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end
  local builtin_ok, builtin = pcall(require, "telescope.builtin")
  if not builtin_ok then
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
    "pyright",
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

  local map = vim.keymap.set
  local opts = {buffer = bufnr, remap = false}

  -- Telescope LSP picker
  map('n', "<C-r>", builtin.lsp_references, opts)
  map('n', "<A-d>", builtin.diagnostics, opts)
  map('n', "gd", builtin.lsp_definitions, opts)
  map('n', "<C-w>", builtin.lsp_workspace_symbols, opts)

  -- map('n', "gd", function() vim.lsp.buf.definition() end, opts)
  map('n', "<A-k>", function() vim.lsp.buf.hover() end, opts)
  -- map('n', "<C-w>", function() vim.lsp.buf.workspace_symbol() end, opts)
  map('n', "<A-f>", function() vim.diagnostic.open_float() end, opts)
  map('n', "[d", function() vim.diagnostic.goto_next() end, opts)
  map('n', "]d", function() vim.diagnostic.goto_prev() end, opts)
  map('n', "<C-a>", function() vim.lsp.buf.code_action() end, {})
  -- map('n', "<C-r>", function() vim.lsp.buf.references() end, opts)
  map('n', "<S-r>", function() vim.lsp.buf.rename() end, opts)
  map('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

return PLUG
