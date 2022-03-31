vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd[[
  if (has("autocmd") && !has("gui_running"))
    augroup colorset
      autocmd!
      autocmd ColorScheme * highlight Normal ctermbg=NONE
    augroup END
  endif

  syntax on
  colorscheme gruvbox

  hi clear SignColumn
]]

vim.cmd [[
  hi clear CursorLine
  hi CursorLine cterm=underline gui=underline ctermfg=NONE guifg=NONE ctermbg=NONE guibg=NONE
]]
