local NOICE = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

function NOICE.config()
	local noice_ok, noice = pcall(require, "noice")
	if not noice_ok then
		return
	end
	local icons_ok, icons = pcall(require, "core.icons")
	if not icons_ok then
		return
	end
	local NI = icons.noice

	noice.setup({
		views = {
			cmdline_popup = {
				position = {
					row = 10,
					col = "50%",
				},
			},
		},
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { icon = NI.cmdline },
				filter = { icon = NI.filter },
				help = { icon = NI.filter },
				lua = { icon = NI.lua },
				search_down = { icon = NI.search },
				search_up = { icon = NI.search },
			},
		},
		lsp = {
			progress = { enabled = false },
		},
	})
end

return NOICE
