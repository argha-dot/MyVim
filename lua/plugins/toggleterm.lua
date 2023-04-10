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
    require "toggleterm".setup {
      size = 10,
      open_mapping = [[<C-\>]],
      shell = osinfo(),
    }
  end,
  -- opts = {
  --   size = 10,
  --   hide_numbers = true,
  --   open_mapping = [[<C-t>]],
  --   shade_filetypes = {},
  --   shade_terminals = true,
  --   shading_factor = 2,
  --   start_in_insert = true,
  --   insert_mappings = true,
  --   persist_size = true,
  --   direction = "horizontal",
  --   close_on_exit = true,
  --   float_opts = {
  --     border = "curved",
  --     winblend = 0,
  --     highlights = {
  --       border = "Normal",
  --       background = "Normal",
  --     },
  --   },
  -- }
}
