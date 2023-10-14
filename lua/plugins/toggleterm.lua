local function osinfo()
  local shell
  if vim.o.shell == 'cmd.exe' then
    shell = [[ powershell.exe ]]
  else
    shell = vim.o.shell
  end

  return shell
end

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = { [[<C-\>]] },
  -- enabled = false,
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll"
  },
  config = function()
    -- code
    local function some()
      local screen_w = vim.opt.columns:get()
      local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

      return {
        border = "single",
        height = 17,
        width = math.floor(screen_w),
        col = 0,
        row = screen_h - 20
      }
    end
    require "toggleterm".setup {
      size = 10,
      open_mapping = [[<C-\>]],
      shell = osinfo(),
      close_on_exit = true,
      direction = "float",
      float_opts = some(),
    }
  end,
}
