return {
  {
    "williamboman/mason.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Mason",
    keys = {{ "<S-m>", "<cmd>Mason<CR>" }},
    config = function()
      local mason_ok, mason = pcall(require, "mason")
      if not mason_ok then
        return
      end
      mason.setup()
    end,
    dependencies = {{
      "williamboman/mason-lspconfig.nvim",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mason_lspconfig_ok then
          return
        end
        mason_lspconfig.setup({
          ensure_installed = { "pyright", "vimls", "lua_ls", "marksman", "emmet_language_server", },
        })
      end
    },
    }
  }
}
