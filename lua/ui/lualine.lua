local PLUG = {
	"nvim-lualine/lualine.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
	-- Eviline config for lualine
	-- Author: shadmansaleh
	-- Credit: glepnir
	local lualine_ok, lualine = pcall(require, "lualine")
	if not lualine_ok then
		return
	end
	local icons_ok, icons = pcall(require, "core.icons")
	if not icons_ok then
		return
	end
	local IL = icons.lualine
	local GIT = icons.git

  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#007ACC',
    fg       = '#bbc2cf',
    white    = '#FFFFFF',
  }

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- cool function for progress
	local progress = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { IL.__1, IL.__2, IL.__3, IL.__4, IL.__5, IL.__6, IL.__7, IL.__8 }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x at right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return IL.vert
		end,
		color = { fg = colors.bg },
		padding = { left = 1 },
	})

	ins_left({
		"branch",
		icon = GIT.branch,
		color = { fg = colors.white, gui = "bold" },
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.white, gui = "bold" },
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	-- Add components to right sections
	ins_right({
		-- Lsp server name .
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = IL.gear,
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		"fileformat",
		fmt = string.upper,
		icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		"encoding", -- option component same as &encoding in viml
		fmt = string.upper,
		cond = conditions.hide_in_width,
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		"location",
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		"progress",
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		progress,
		color = { fg = colors.white, gui = "bold" },
	})

	ins_right({
		function()
			return IL.vert
		end,
		color = { fg = colors.bg },
		padding = { left = 1 },
	})

	-- Now don't forget to initialize lualine
	lualine.setup(config)
	vim.cmd("set laststatus=3")
end

return PLUG
