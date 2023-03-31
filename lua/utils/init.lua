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

function utils.get_fileinfo()
  local file = {}

  file["name"] = vim.fn.expand("%:t")
  file["extension"] = vim.fn.expand("%:e")
  file["icon"] = ""

  if not utils.is_empty(file["name"]) then
    file["icon"] = require("nvim-web-devicons").get_icon_by_filetype(file["extension"], { default = true })
    if utils.is_empty(file["icon"]) then
      file["icon"] = ""
    end
  end

  return file
end

return utils

