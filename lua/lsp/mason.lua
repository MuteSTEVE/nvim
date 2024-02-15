local MASON = {
	"williamboman/mason.nvim",
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Mason",
	keys = { { "<S-m>", "<cmd>Mason<CR>" } },
}

local MASON_LSPCONFIG = {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPost", "BufNewFile" },
}

function MASON.config()
	local mason_ok, mason = pcall(require, "mason")
	if not mason_ok then
		return
	end
	mason.setup()
end

function MASON_LSPCONFIG.config()
	local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not mason_lspconfig_ok then
		return
	end
	mason_lspconfig.setup({
		ensure_installed = {
			"pyright",
			"vimls",
			"lua_ls",
			"marksman",
		},
	})
end

return MASON, MASON_LSPCONFIG
