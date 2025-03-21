local PLUG = {
  "nvim-telescope/telescope.nvim",
  dependencies =  "nvim-lua/plenary.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>f", function()
      require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown({ previewer = false }))
    end
    },
    { "<leader>F", function()
      require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown({ previewer = false, hidden = true }))
    end
    },
    { "<leader>o", function()
      require("telescope.builtin").oldfiles(
        require("telescope.themes").get_ivy({ previewer = true }))
    end
    },
    { "<leader>b", function()
      require("telescope.builtin").buffers(
        require("telescope.themes").get_dropdown({ previewer = false }))
    end
    },
    { "<C-f>", function()
      require("telescope.builtin").live_grep(
        require("telescope.themes").get_ivy({ previewer = true }))
    end
    },
  },
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
  local icons_ok, icons = pcall(require, "core.icons")
  if not icons_ok then
    return
  end
  local IT = icons.telescope

  telescope.setup({
    defaults = {
      prompt_prefix = " " .. IT.find .. " " .. " ",
      selection_caret = IT.select .. " ",
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<leader>f"] = actions.close,
          ["<leader>F"] = actions.close,
          ["<leader>H"] = actions.close,
          ["<leader>b"] = actions.close,
          ["<leader>q"] = actions.close,
          ["<C-b>"] = actions.close,
          ["<C-a>"] = actions.close,
          ["<Esc>"] = actions.close,
        },
      },
    },
  })
end

return PLUG
