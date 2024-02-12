local PLUG = {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'kyazdani42/nvim-web-devicons',
  lazy = true,
  event = "VeryLazy",
  cmd = { "NvimTreeFindFile", "NvimTreeRefresh", "NvimTreeToggle", },
  keys = { "<leader>n", "<cmd>NvimTreeFindFileToggle<cr>" }
}

function PLUG.config()
  local nvimtree_ok, nvim_tree = pcall(require, "nvim-tree")
  if not nvimtree_ok then
    return
  end
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end
  local NT = icons.nvimtree
  local GIT = icons.git

  nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      root_folder_modifier = ":t",
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true,
          git = true,
        },
        glyphs = {
          default = NT.GlyphDefault,
          symlink = NT.GlyphSymlink,
          folder = {
            default = NT.default,
            open = NT.open,
            empty = NT.empty,
            empty_open = NT.empty_open,
            symlink = NT.symlink,
          },
          git = {
            deleted = GIT.deleted,
            ignored = GIT.ignored,
            renamed = GIT.renamed,
            staged = GIT.staged,
            unmerged = GIT.unmerged,
            unstaged = GIT.unstaged,
            untracked = GIT.untracked,
          },
        }
      }
    }
  }

  vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<cr>", {silent = true})
end

return PLUG
