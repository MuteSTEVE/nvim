local CONFORM = {
	"stevearc/conform.nvim",
	ft = { "lua", "python", "css", "javascript", "html" },
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
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = "CustomBuffer",
			pattern = { "lua", "python", "css", "javascript", "html" },
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		}),
	})
end

return CONFORM
