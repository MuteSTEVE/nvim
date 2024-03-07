local PLUG = {
	"norcalli/nvim-colorizer.lua",
	cmd = "ColorizerToggle",
	ft = { "css", "js", "html" },
	keys = { { "<leader>c", "<cmd>ColorizerToggle<CR>" } },
}

function PLUG.config()
	local colorizer_ok, colorizer = pcall(require, "colorizer")
	if not colorizer_ok then
		return
	end
	colorizer.setup({})
end

return PLUG
