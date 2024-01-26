local function shell(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    local icon = "󰘬 "
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

local branch = shell("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
local file_name = "%f"
local modified = "%m"
local read_only = "%r"

local file_type = "%{&filetype != '' ? &filetype .. '' : ''}"
local file_encoding = "%{&fileencoding}"
local file_format = "%{&fileformat}"
local lc = "%l" .. ":" .. "%c"
local percentage = "%p%%"

vim.cmd("set laststatus=3")
vim.opt.statusline = background ..
spc..spc..spc..
branch .. file_name ..spc.. modified ..spc.. read_only ..
align_right..
file_type ..spc..spc.. file_encoding ..spc..spc.. file_format ..spc..spc.. lc ..spc.. percentage ..
spc..spc..spc
