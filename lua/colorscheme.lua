vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd[[
  hi Comment cterm=italic

  if (has("autocmd") && !has("gui_running"))
    augroup colorset
      autocmd ColorScheme * highlight Normal ctermbg=NONE
    augroup END
  endif

  syntax on
  colorscheme gruvbox

  hi CursorLine cterm=underline ctermfg=NONE gui=NONE guifg=NONE ctermbg=NONE guibg=NONE
  hi clear SignColumn
]]

