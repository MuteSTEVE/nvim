local config = {
  "core.options",
  "core.keymaps",
  "core.lazy",
  "core.icons",
  "core.autocmd",
}

local function source_module(module_name)
  local success, error_msg = pcall(require, module_name)
  if not success then
    print("Error sourcing " .. module_name .. ": " .. error_msg)
  end
end

for _, module in ipairs(config) do
  source_module(module)
end
