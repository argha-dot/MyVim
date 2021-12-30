local cmd = vim.cmd
local o = vim.o
local indent = 2

cmd [[
	set path+=**
  set whichwrap+=<,>,[,],h,l"
	autocmd InsertEnter * norm zz
]]

-- Markdown and LaTeX Settings
cmd [[
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.tex set filetype=tex

  augroup WrapLineInMDFile
    autocmd!
    autocmd FileType markdown setlocal linebreak wrap 
    autocmd FileType markdown set spell
  augroup END

  augroup LaTeXStuff
    autocmd!
    autocmd FileType tex setlocal linebreak wrap 
    autocmd FileType tex set spell
  augroup END
]]


cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=250}
  augroup END
]]

cmd [[
  augroup no_relative_for_insert
    autocmd!
    au InsertEnter * set norelativenumber
    au InsertLeave * set relativenumber
  augroup END
]]

-- gg=G''

o.swapfile = false
o.backup = false
o.writebackup = false
o.hidden = true

-- Tab length
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent

-- Splits
o.splitright = true
o.splitbelow = true

o.cmdheight = 1 -- Neovim commandline space
o.pumheight = 10 -- Pop-up menu height

o.wildmenu = true

-- Indent and tab stuff
o.smartcase = true
o.smartindent = true
o.autoindent = true
o.smarttab = true
o.expandtab = true

o.timeoutlen = 400 -- time to wait for mapped sequence to complete
o.updatetime = 750

o.mouse = 'a' -- Mouse support
o.conceallevel = 1
o.showtabline = 2
o.laststatus = 2
o.clipboard = "unnamed,unnamedplus" -- Use system clipboard
o.syntax = "enable"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.background = "dark"
o.guicursor = ""
o.hlsearch = true -- Highlight in real time
-- o.

o.cursorline = true
o.wrap = false
o.undofile = true -- Persist undos
o.inccommand = "nosplit"

-- Scroll offset... just see the :h
o.scrolloff = 8
o.sidescrolloff = 8

-- Numberline stuff
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "yes"

