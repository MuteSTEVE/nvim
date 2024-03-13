local LINT = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
}

function LINT.config()
  local lint_ok, lint = pcall(require, "lint")
  if not lint_ok then
    return
  end

  lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "mypy", "flake8", "pylint" },
  }
  vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = "lint",
    pattern = { "*.lua", "*.py", "*.css", "*.js", "*.html" },
    callback = function()
      lint.try_lint()
    end,
  })
end

return LINT
