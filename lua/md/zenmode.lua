local ZEN = {
	"folke/zen-mode.nvim",
	dependencies = "folke/twilight.nvim",
	keys = { "<leader>z", "<cmd>ZenMode<CR>" },
	ft = "markdown",
	cmd = "ZenMode",
}

function ZEN.config()
	local status_ok, zen = pcall(require, "zen-mode")
	if not status_ok then
		return
	end

	zen.setup({
		window = {
			options = {
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 0,
			},
			twilight = { enabled = true },
			tmux = { enabled = false },
			alacritty = {
				enabled = false,
				font = "14",
			},
		},

		on_open = function(_)
			vim.fn.system([[tmux set status off]])
			vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z]])
		end,
		on_close = function(_)
			vim.fn.system([[tmux set status on]])
			vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z]])
		end,

		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", {}),
	})
end

return ZEN
