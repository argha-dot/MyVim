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
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  augroup END
]]
