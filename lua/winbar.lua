local utils = require("utils")
-- vim.o.winbar = [[ %t %m ]]
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

local excludes = function()
  local contains = false
  if vim.tbl_contains(exclude_ft, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  for _, ft in ipairs(exclude_ft) do
    if not require"utils".is_empty(string.find(vim.bo.filetype, ft)) then
      vim.opt_local.winbar = nil
      return true
    end
  end

  return contains
end

local winbar_init = function()
  if excludes() then return end
  local fileinfo = require"utils".get_fileinfo()
  local value = " " .. fileinfo["icon"] .. " " .. "%#LineNr#" .. fileinfo["name"] .. "%*"
  -- print( vim.inspect( require"utils".get_fileinfo() ) )
  if not utils.is_empty(value) and vim.api.nvim_buf_get_option(0, "mod") then
    value = value .. " " .. "%#LineNr#" .. "" .. "%*"
  end
  local status, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status then return end
end


vim.api.nvim_create_autocmd(
  { "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" },
  {
    callback = function()
      winbar_init()
    end
  }
)
