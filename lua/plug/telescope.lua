local PLUG = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'kyazdani42/nvim-web-devicons'
  },
  lazy = true,
  cmd = "Telescope",
  keys = {
    { "<leader>f", function() require("telescope.builtin").find_files(require("telescope.themes").get_dropdown{previewer = false}) end },
    { "<C-b>", function() require("telescope").extensions.file_browser.file_browser({previewer = false}) end },
    { "<leader>H", function() require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy{previewer = true}) end },
    { "<leader>b", function() require("telescope.builtin").buffers(require("telescope.themes").get_dropdown{previewer = false}) end },
    { "<C-f>", function() require("telescope.builtin").live_grep(require("telescope.themes").get_ivy{previewer = true}) end },
  }
}

function PLUG.config()
  local telescope_ok, telescope = pcall(require, "telescope")
  if not telescope_ok then
    return
  end
  local actions_ok, actions = pcall(require, "telescope.actions")
  if not actions_ok then
    return
  end
  local fb_actions = telescope.extensions.file_browser.actions
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end
  local ITL = icons.telescope

  telescope.setup({
    defaults = {
      prompt_prefix = ITL.find .. " ",
      selection_caret = ITL.select .. " ",
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<leader>f"] = actions.close,
          ["<leader>H"] = actions.close,
          ["<leader>b"] = actions.close,
          ["<C-b>"] = actions.close,
          ["<Esc>"] = actions.close,

          -- file_browser
          ["~"] = fb_actions.goto_home_dir,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-c>"] = fb_actions.create,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-y>"] = fb_actions.copy,
        },
      },
    }
  })
  telescope.load_extension "file_browser"
end

return PLUG
