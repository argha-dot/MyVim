local o = vim.o

o.swapfile = false
o.backup = false
o.writebackup = false
o.hidden = true

o.belloff = "all"

-- Splits
o.splitright = true
o.splitbelow = true
o.equalalways = false

o.cmdheight = 0 -- Neovim commandline space
o.pumheight = 10 -- Pop-up menu height
o.colorcolumn = '80'

o.wildmenu = true

o.timeoutlen = 400 -- time to wait for mapped sequence to complete
o.updatetime = 750

o.mouse = 'a' -- Mouse support
o.conceallevel = 1
o.showtabline = 2
o.clipboard = "unnamedplus" -- Use system clipboard
o.syntax = "enable"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.background = "dark"

o.guicursor = ""

o.hlsearch = true -- Highlight in real time
o.incsearch = true
o.showmode = false -- Remove messages like insert and such

o.wrap = false
o.undofile = true -- Persist undos
o.inccommand = "nosplit"

o.ignorecase = true
o.smartcase = true

-- Scroll stuff
o.scrolloff = 8
o.smoothscroll = true
o.sidescrolloff = 8

-- Numberline stuff
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "yes"

-- Indenting stuff
o.breakindent = true -- Better word Wrapping
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- fancy stuff
-- vim.opt.listchars:append({eol = "↵"})
-- o.list = true


-- FILETYPE STUFF
vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0
