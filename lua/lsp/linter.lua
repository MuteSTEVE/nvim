local PLUG = {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
	local lint_ok, lint = pcall(require, "lint")
	if not lint_ok then
		return
	end

	lint.linters_by_ft = {
		lua = { "luacheck" },
		python = { "mypy" },
	}
	vim.api.nvim_create_augroup("lint", { clear = true })
	vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePre", "InsertLeave" }, {
		group = "lint",
		pattern = "*",
		callback = function()
			lint.try_lint()
		end,
	})
end

return PLUG
