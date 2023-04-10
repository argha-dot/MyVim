local utils = require "utils"

vim.o.laststatus = 3
vim.o.showtabline = 0

local exclude_ft = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "Neogit",
  "Lspsaga",
  "Definition",
  "prompt",
  "neo-tree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "nabla",
  "spectre_panel",
  "toggleterm",
  "terminal",
  "NvimTree",
  "qf",
}

local something = {
  help = "thing",
  -- NvimTree = "some"
}

local excludes = function()
  local contains = false
  if vim.tbl_contains(exclude_ft, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    contains = true
  end

  for _, ft in ipairs(exclude_ft) do
    if not require"utils".is_empty(string.find(vim.bo.filetype, ft)) then
      vim.opt_local.winbar = nil
      contains = true
    end
  end

  return contains
end

local M = {}

M.winbar_init = function()
  if excludes() then return end

  local fileinfo = require"utils".get_fileinfo()

  local hl_grp = "FileIconColor" .. fileinfo["extension"]
  vim.api.nvim_set_hl(0, hl_grp, { fg = fileinfo["color"] })

  local value = "%#" .. hl_grp .. "#" .. fileinfo["icon"] .. "%*" .. " " .. "%#LineNr#" .. fileinfo["name"] .. "%*"

  local status_saga, saga_statusbar = pcall(require, "lspsaga.symbolwinbar")
  local saga_statusbar_string = saga_statusbar:get_winbar()
  if (status_saga and not utils.is_empty(saga_statusbar_string)) then
    value = saga_statusbar_string
  else
    value = value
  end

  value = " " .. value

  if not utils.is_empty(value) and vim.api.nvim_buf_get_option(0, "mod") then
    value = " " .. "%#LineNr#" .. "" .. "%*" .. value
  end

  local status, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status then return end
end

return M
