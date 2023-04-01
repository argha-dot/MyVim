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
  -- enabled = false,
  opts = {
    size = 10,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = osinfo(),
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  }
}
