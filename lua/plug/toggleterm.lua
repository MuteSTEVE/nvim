local MAP = {
	lazygit = "<leader>lg",
	ncmpcpp = "<leader>m",
	ranger = "<leader>r",
	tab = "<leader>tt",
	float = "<leader>tf",
	vertical = "<leader>tv",
	horizontal = "<leader>th",
}
local PLUG = {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	keys = {
		{ MAP.lazygit, "<cmd>lua Lazygit()<CR>" },
		{ MAP.ncmpcpp, "<cmd>lua Ncmpcpp()<CR>" },
		{ MAP.ranger, "<cmd>lua Ranger()<CR>" },
		{ MAP.tab, "<cmd>ToggleTerm direction=tab<CR>" },
		{ MAP.float, "<cmd>ToggleTerm direction=float<CR>" },
		{ MAP.vertical, "<cmd>ToggleTerm direction=vertical size=50<CR>" },
		{ MAP.horizontal, "<cmd>ToggleTerm direction=horizontal size=10<CR>" },
	},
}

function PLUG.config()
	local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
	if not toggleterm_ok then
		return
	end
	local Terminal = require("toggleterm.terminal").Terminal

	toggleterm.setup({
		open_mapping = [[<A-f>]],
		start_in_insert = true,
		direction = "float",
		float_opts = { border = "curved" },
	})

	-- Create a custom toggleterm window
	local ncmpcpp = Terminal:new({ cmd = "ncmpcpp" })
	function Ncmpcpp()
		ncmpcpp:toggle()
	end
	local ranger = Terminal:new({ cmd = "ranger" })
	function Ranger()
		ranger:toggle()
	end
	local lazygit = Terminal:new({ cmd = "lazygit" })
	function Lazygit()
		lazygit:toggle()
	end

	-- Escape terminal mode
	local map = vim.keymap.set
	local NRS = { noremap = true, silent = true }
	map("t", MAP.lazygit, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.ncmpcpp, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.ranger, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.tab, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.float, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.vertical, "<C-\\><C-n><cmd>q!<CR>", NRS)
	map("t", MAP.horizontal, "<C-\\><C-n><cmd>q!<CR>", NRS)

	-- Move from terminal back and forth
	map("t", "<C-h>", "<C-\\><C-n><C-w>h<CR>{}k$", NRS)
	map("t", "<C-j>", "<C-\\><C-n><C-w>j<CR>{}k$", NRS)
	map("t", "<C-k>", "<C-\\><C-n><C-w>k<CR>{}k$", NRS)
	map("t", "<C-l>", "<C-\\><C-n><C-w>l<CR>{}k$", NRS)
	map("t", "<S-Esc>", "<C-\\><C-n><CR>", NRS)
end

return PLUG
