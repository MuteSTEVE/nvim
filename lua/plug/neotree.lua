local NEOTREE = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}

function NEOTREE.config()
	local neotree_ok, neotree = pcall(require, "neo-tree")
	if not neotree_ok then
		return
	end
	local icons_ok, icons = pcall(require, "core.icons")
	if not icons_ok then
		return
	end
	local NT = icons.neotree
	local GIT = icons.git

	neotree.setup({
		window = { width = 30 },
		enable_git_status = true,
		default_component_configs = {
			indent = {
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				with_expanders = true,
				expander_collapsed = NT.expander_collapsed,
				expander_expanded = NT.expander_expanded,
			},
			icon = {
				default = NT.default,
				folder_closed = NT.folder_closed,
				folder_empty = NT.folder_empty,
				folder_open = NT.folder_open,
			},
			git_status = {
				symbols = {
					added = GIT.added,
					modified = GIT.modified,
					deleted = GIT.deleted,
					renamed = GIT.deleted,
					untracked = GIT.untracked,
					ignored = GIT.ignored,
					unstaged = GIT.unstaged,
					staged = GIT.staged,
					conflict = GIT.conflict,
				},
			},
		},
	})
	vim.keymap.set("n", "<leader>n", "<cmd>Neotree left toggle<CR>")
end

return NEOTREE
