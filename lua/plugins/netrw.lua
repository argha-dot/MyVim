local utils = require("utils")

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- vim.g.netrw_localcopydircmd = 'cp -r'

vim.cmd [[
  hi! link netrwMarkFile Search
]]

utils.map('n', '<C-b>', ':Lex<CR>', {noremap = true, silent = true})

vim.cmd [[
  function! NetrwMapping()
    nmap <buffer> P <c-w>z
    nmap <buffer> <TAB> mf
    nmap <buffer> <S-TAB> mF
    nmap <buffer> d D
    nmap <buffer> a %:w<CR>:buffer #<CR>
  endfunction

  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END
]]
