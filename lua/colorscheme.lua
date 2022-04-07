vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd[[
  syntax on
  colorscheme nvcode

  if (has("autocmd") && !has("gui_running"))
    augroup colorset
      autocmd!
      autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    augroup END
  endif

  hi clear SignColumn
  hi clear CursorLine
  hi Normal ctermbg=NONE guibg=NONE
  hi CursorLine cterm=underline gui=underline
]]
