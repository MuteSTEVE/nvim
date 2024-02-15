local PLUG = {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
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
			lua = { "stylua" },
			python = { "isort", "black" },
		},
	})
end

return PLUG
