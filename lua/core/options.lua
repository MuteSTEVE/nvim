local options = {
	backup = false,
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 1,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	filetype = on,
	guifont = "monospace:h17",
	hlsearch = true,
	ignorecase = true,
	linebreak = true,
	mouse = "a",
	number = true,
	numberwidth = 4,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 10,
	shiftwidth = 2,
	showmode = false,
	sidescrolloff = 10,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	spelllang = "en_us",
	spell = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	syntax = on,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 300,
	whichwrap = "bs<>[]hl",
	wrap = true,
	writebackup = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

if not vim.fn.exists("guin running") then
	vim.o.t_Co = 256
end

vim.cmd([[autocmd VimEnter * echo "Hello"]])
