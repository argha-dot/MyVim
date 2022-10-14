local o = vim.o
local indent = 2

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

o.cmdheight = 0 -- Neovim commandline space
o.pumheight = 10 -- Pop-up menu height
-- o.colorcolumn = '80'

o.wildmenu = true

-- Indent and tab stuff
o.smartcase = true
o.autoindent = true
o.smartindent = false
o.smarttab = true
o.expandtab = true

o.timeoutlen = 400 -- time to wait for mapped sequence to complete
o.updatetime = 750

o.mouse = 'a' -- Mouse support
o.conceallevel = 1
o.showtabline = 2
o.laststatus = 2
o.clipboard = "unnamedplus" -- Use system clipboard
o.syntax = "enable"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.background = "dark"
o.guicursor = ""
o.hlsearch = true -- Highlight in real time
o.showmode = false
-- o.foldlevelstart = 99

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
o.breakindent = true -- Better word Wrapping

-- fancy stuff
vim.opt.listchars:append({eol = "↵"})
o.list = true
