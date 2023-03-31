local o = vim.o

o.swapfile = false
o.backup = false
o.writebackup = false
o.hidden = false

-- Splits
o.splitright = true
o.splitbelow = true

o.cmdheight = 0 -- Neovim commandline space
o.pumheight = 10 -- Pop-up menu height
-- o.colorcolumn = '80'

o.wildmenu = true

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
o.showmode = false -- Remove messages like insert and such

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
