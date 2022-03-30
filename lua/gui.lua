vim.o.guifont = "Delugia:h12"

if (vim.g.neovide) then
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.o.guifont = "Delugia:h16"
  -- vim.o.neovide_fullscreen = true

  vim.cmd [[
    colorscheme nvcode
  ]]
end
