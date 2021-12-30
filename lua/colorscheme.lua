vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd[[
    hi Comment cterm=italic

    if (has("autocmd") && !has("gui_running"))
      augroup colorset
        autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
      augroup END
    endif

    syntax on
    colorscheme nvcode

    hi cursorline cterm=underline ctermfg=NONE gui=underline guifg=NONE ctermbg=NONE guibg=NONE
    hi clear SignColumn
]]

