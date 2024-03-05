local icons_ok, icons = pcall(require, "core.icons")
if not icons_ok then
  return
end
local GIT = icons.git

local function shell(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  local icon = GIT.branch
  handle:close()
  if string.len(result) > 0 then
    return icon .. result .. " " .. " "
  else
    return ""
  end
end

local background = "%#background#"
local spc = " "
local align_right = "%="
local slash = [[/]]

local branch = shell("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
local file_name = "%f"
local modified = "%m"
local read_only = "%r"

local linepost = "%c" .. ":" .. "%l"
local total_lines = "%L"
local percentage = "%p%%"

vim.cmd("highlight background guibg=guibg guifg=white")
vim.opt.laststatus = 3
vim.opt.statusline = background
    .. spc
    .. spc
    .. branch
    .. file_name
    .. spc
    .. modified
    .. spc
    .. read_only
    .. align_right
    .. spc
    .. spc
    .. linepost
    .. slash
    .. total_lines
    .. spc
    .. percentage
    .. spc
