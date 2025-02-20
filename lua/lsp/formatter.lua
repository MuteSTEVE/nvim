local CONFORM = {
	"stevearc/conform.nvim",
	ft = { "c", "cpp", "lua", "python", "css", "javascript", "html" },
}

function CONFORM.config()
	local conform_ok, conform = pcall(require, "conform")
	if not conform_ok then
		return
	end

	conform.setup({
		format_on_save = {
			timeout_ms = 100,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		-- Autoformat in lua/core/autocmd.lua
	})
end

return CONFORM
