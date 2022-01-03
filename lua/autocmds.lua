local cmd = vim.cmd


cmd [[
  set path+=**
  set whichwrap+=<,>,[,],h,l"
]]

-- Markdown and LaTeX Settings
cmd [[
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.tex set filetype=tex

  augroup WrapLineInMDFile
    autocmd!
    autocmd FileType markdown setlocal linebreak wrap 
    autocmd FileType markdown setlocal spell
  augroup END

  augroup LaTeXStuff
    autocmd!
    autocmd FileType tex setlocal linebreak wrap 
    autocmd FileType tex setlocal spell
  augroup END
]]

-- Fold shit
cmd [[
  set foldtext=MyFoldText()
  function MyFoldText()
    let nucolwidth = &fdc + &number*&numberwidth
    let winwd = winwidth(0) - nucolwidth - 5
    let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
    let prefix = " _______>>> "
    let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
    let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
    let fillcharcount = winwd - len(line) - len(fdnfo)
    return line . repeat(" ",fillcharcount) . fdnfo
  endfunction


  augroup OpenAllFoldsOnFileOpen
    autocmd!
    au BufNewFile,BufRead * normal zR
  augroup END
]]

-- Insert Stuff
cmd [[
  augroup no_relative_for_insert
    autocmd!
    au InsertEnter * norm zz
    au InsertEnter * set norelativenumber
    au InsertLeave * set relativenumber
  augroup END
]]

cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=250}
  augroup END
]]

