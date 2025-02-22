local KEYMAP = {
	lazygit = "<leader>lg",
	ncmpcpp = "<leader>m",
	ranger = "<leader>r",
	term_tab = "<leader>tt",
	term_float = "<leader>tf",
	term_vertical = "<leader>tv",
	term_horizontal = "<leader>th",
}
local PLUG = {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	keys = {
		{ KEYMAP.lazygit, "<cmd>lua Lazygit()<CR>" },
		{ KEYMAP.ncmpcpp, "<cmd>lua Ncmpcpp()<CR>" },
		{ KEYMAP.ranger, "<cmd>lua Ranger()<CR>" },
		{ KEYMAP.term_tab, "<cmd>lua Term_tab()<CR>" },
		{ KEYMAP.term_float, "<cmd>lua Term_float()<CR>" },
		{ KEYMAP.term_vertical, "<cmd>lua Term_vertical()<CR>" },
		{ KEYMAP.term_horizontal, "<cmd>lua Term_horizontal()<CR>" },
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
	local ncmpcpp = Terminal:new({ cmd = "ncmpcpp", hidden = true })
	function Ncmpcpp()
		ncmpcpp:toggle()
	end
	local ranger = Terminal:new({ cmd = "ranger", hidden = true })
	function Ranger()
		ranger:toggle()
	end
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	function Lazygit()
		lazygit:toggle()
	end

	local term_tab = Terminal:new({ cmd = "bash", direction = "tab", hidden = true })
	function Term_tab()
		term_tab:toggle()
	end
	local term_float = Terminal:new({ cmd = "bash", direction = "float", hidden = true })
	function Term_float()
		term_float:toggle()
	end
	local term_vertical = Terminal:new({ cmd = "bash", direction = "vertical", hidden = true })
	function Term_vertical()
		term_vertical:toggle()
	end
	local term_horizontal = Terminal:new({ cmd = "bash", direction = "horizontal", hidden = true })
	function Term_horizontal()
		term_horizontal:toggle()
	end

	-- Escape terminal mode
	local map = vim.keymap.set
	local NR = { noremap = true, silent = true }
	map("t", KEYMAP.lazygit, "<C-\\><C-n><cmd>q!<CR>", NR)
	map("t", KEYMAP.ncmpcpp, "<C-\\><C-n><cmd>q!<CR>", NR)
	map("t", KEYMAP.ranger, "<C-\\><C-n><cmd>q!<CR>", NR)

	-- Move from terminal back and forth
	map("t", "<C-h>", "<C-\\><C-n><C-w>h<CR>{}k$", NR)
	map("t", "<C-j>", "<C-\\><C-n><C-w>j<CR>{}k$", NR)
	map("t", "<C-k>", "<C-\\><C-n><C-w>k<CR>{}k$", NR)
	map("t", "<C-l>", "<C-\\><C-n><C-w>l<CR>{}k$", NR)
	map("t", "<S-Esc>", "<C-\\><C-n><CR>", NR)
end

return PLUG
