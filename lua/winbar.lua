-- vim.o.winbar = [[ %t %m ]]
vim.o.showtabline = 0

local exclude_ft = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "neo-tree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "NvimTree"
}

local excludes = function()
  if vim.tbl_contains(exclude_ft, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  return false
end

local winbar_init = function()
  if excludes() then return end
  local fileinfo = require"utils".get_fileinfo()
  local value = fileinfo["icon"] .. " " .. "%#LineNr#" .. fileinfo["name"] .. "%m" .. "%*"
  -- print( vim.inspect( require"utils".get_fileinfo() ) )
  --
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
