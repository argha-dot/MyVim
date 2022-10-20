local utils = require'utils'
local opts = {noremap = true, silent = true}

vim.o.guifont = "Delugia:h12"

if (vim.g.neovide) then
  vim.g.neovide_refresh_rate = 30
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_remember_window_size = true

  utils.map('n', '<F11>', '<cmd>lua Fullscreen()<CR>', opts)
end

function Fullscreen()
  if not vim.g.neovide_fullscreen then
    vim.g.neovide_fullscreen = true
  else
    vim.g.neovide_fullscreen = false
  end
end

