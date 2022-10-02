vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd[[
  syntax on
  colorscheme nvcode

  hi clear SignColumn
  hi clear CursorLine
  hi CursorLine cterm=underline gui=underline
  hi Normal ctermbg=NONE guibg=NONE
]]
