local MASON = {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<S-m>", "<cmd>Mason<CR>" } },
}

function MASON.config()
	local mason_ok, mason = pcall(require, "mason")
	if not mason_ok then
		return
	end
	mason.setup()
end

return MASON
