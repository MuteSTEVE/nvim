local ROSE = {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
}

function ROSE.config()
	local rose_pine_ok, rose_pine = pcall(require, "rose-pine")
	if not rose_pine_ok then
		return
	end
	rose_pine.setup({})
	vim.cmd("colorscheme rose-pine")
end

return ROSE
