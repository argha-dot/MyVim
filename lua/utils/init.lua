local utils = {}

local scopes = {
    o = vim.o,
    b = vim.bo,
    w = vim.wo
}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, key, binding, opts)
  vim.api.nvim_set_keymap(mode, key, binding, opts)
end

function utils.is_empty(s) return s == nil or s == '' end

function utils.get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end

  return keys
end

function utils.get_fileinfo()
  local file = {}

  file["name"] = vim.fn.expand("%:t")
  file["extension"] = vim.fn.expand("%:e")
  file["icon"] = ""
  file["color"] = ""

  if not utils.is_empty(file["name"]) then
    file["icon"], file["color"] = require("nvim-web-devicons").get_icon_color(file["name"], file["extension"])
    if utils.is_empty(file["icon"]) then
      file["icon"] = ""
      file["color"] = ""
    end
  end

  return file
end

return utils
