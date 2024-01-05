local PLUG = {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-telescope/telescope-ui-select.nvim' },
  lazy = true,
  cmd = "Telescope",
  keys = {
    { "<leader>f", function() require("telescope.builtin").find_files(require("telescope.themes").get_dropdown{previewer = false}) end },
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
  local themes_ok, themes = pcall(require, "telescope.themes")
  if not themes_ok then
    return
  end
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
          ["<C-f>"] = actions.close,
          ["<leader>b"] = actions.close,
          ["<leader>u"] = actions.close,
          ["<esc>"] = actions.close,
        },
      },
    },
    extensions = {
      ["ui-select"] = { themes.get_dropdown }
    }
  })
  telescope.load_extension("ui-select")
end

return PLUG
