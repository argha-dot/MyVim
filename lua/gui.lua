vim.o.guifont = "Delugia:h12"

if (vim.g.neovide) then
  vim.g.neovide_cursor_vfx_mode = "railgun"

  vim.cmd [[
    colorscheme nvcode
  ]]
end
