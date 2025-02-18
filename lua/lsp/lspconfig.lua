local PLUG = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
	local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_ok then
		return
	end
	local telescope_ok, telescope = pcall(require, "telescope.builtin")
	if not telescope_ok then
		return
	end
	local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not cmp_nvim_lsp_ok then
		return
	end
	local capabilities = cmp_nvim_lsp.default_capabilities()
	local icons_ok, icons = pcall(require, "core.icons")
	if not icons_ok then
		return
	end
	local DS = icons.diag_signs

	local langservers = {
		"bashls",
		"clangd",
		"emmet_language_server",
		"lua_ls",
		"marksman",
		"pyright",
		"vimls",
	}
	for _, server in ipairs(langservers) do
		lspconfig[server].setup({ capabilities = capabilities })
	end

	-- To shutup neovim complaining about "undefined global vim" in lua file
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	})

	local diag_signs = { Error = DS.Error, Warn = DS.Warn, Hint = DS.Hint, Info = DS.Info }
	for type, icon in pairs(diag_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local diag = vim.diagnostic
	local buf = vim.lsp.buf
	local map = vim.keymap.set

	diag.config({ virtual_text = false })
	map("n", "<leader>lf", telescope.lsp_references)
	map("n", "<leader>ld", telescope.diagnostics)
	map("n", "gd", function()
		buf.definition()
	end)
	map("n", "<leader>lh", function()
		buf.hover()
	end)
	map("n", "<leader>lf", function()
		diag.open_float()
	end)
	map("n", "[d", function()
		diag.goto_next()
	end)
	map("n", "]d", function()
		diag.goto_prev()
	end)
	map("n", "<leader>la", function()
		buf.code_action()
	end)
	map("n", "<S-r>", function()
		buf.rename()
	end)
	map("n", "<leader>ls", function()
		buf.signature_help()
	end)
end

return PLUG
