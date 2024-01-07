local function shell(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n$", "") -- Remove trailing newline
end

local background = "%#background#"
local spc = " "
local align_right = "%="
local branch_icon = 'echo "$(echo "󰘬")"'
local branch_cmd = 'echo "$(git rev-parse --abbrev-ref HEAD)"'

local branch = shell(branch_icon) .. spc .. shell(branch_cmd)
local file_name = "%f"
local modified = "%m"
local read_only = "%r"

local file_type = "%{&filetype != '' ? &filetype .. '' : ''}"..spc..spc
local file_encoding = "%{&fileencoding}"
local file_format = "%{&fileformat}"
local ln = "%l"
local col = "%c"
local percentage = "%p%%"

vim.cmd "highlight background guibg=#007ACC guifg=white"
vim.opt.statusline = background ..
spc..spc..spc
.. branch ..spc.. file_name ..spc.. modified .. read_only ..spc
.. align_right
.. file_type .. file_encoding ..spc..spc.. file_format ..spc..spc.. ln .. ":" .. col ..spc.. percentage ..
spc..spc..spc
