local LSPCONFIG = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
}

function LSPCONFIG.config()
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
	local IS = icons.signs

	local langservers = { "pyright", "vimls", "lua_ls" }
	for _, server in ipairs(langservers) do
		lspconfig[server].setup({ capabilities = capabilities })
	end

	-- To shutup neovim complaining about "undefined global vim"
	-- Doesn't really matter tho, linter will still complaining
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	})

	local signs = { Error = IS.Error, Warn = IS.Warn, Hint = IS.Hint, Info = IS.Info }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local diag = vim.diagnostic
	local buf = vim.lsp.buf
	local map = vim.keymap.set

	diag.config({ virtual_text = false })
	map("n", "<A-r>", telescope.lsp_references, {})
	map("n", "<A-d>", telescope.diagnostics, {})
	map("n", "gd", function()
		buf.definition()
	end, {})
	map("n", "<A-h>", function()
		buf.hover()
	end, {})
	map("n", "<A-f>", function()
		diag.open_float()
	end, {})
	map("n", "[d", function()
		diag.goto_next()
	end, {})
	map("n", "]d", function()
		diag.goto_prev()
	end, {})
	map("n", "<C-a>", function()
		buf.code_action()
	end, {})
	map("n", "<S-r>", function()
		buf.rename()
	end, {})
	map("i", "<A-h>", function()
		buf.signature_help()
	end, {})
end

return LSPCONFIG
