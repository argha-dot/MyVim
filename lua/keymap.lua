local utils = require'utils'
local opts = {noremap = true, silent = true}


utils.map('n', '<Space>',   '<NOP>', opts)

-- Leader Key
vim.g.mapleader = ' '

-- No Highlight
utils.map('n', '<Esc>',     ':noh<CR>', opts)


-- I hate Esc
utils.map('i', '<C-c>',     '<esc>', opts)
utils.map('v', '<C-c>',     '<esc>', opts)


-- Better buffer moving
utils.map('n', '<C-left>',  '<C-w>h', {silent = true})
utils.map('n', '<C-down>',  '<C-w>j', {silent = true})
utils.map('n', '<C-up>',    '<C-w>k', {silent = true})
utils.map('n', '<C-right>', '<C-w>l', {silent = true})

utils.map('n', '<C-h>',     '<C-w>h', {silent = true})
utils.map('n', '<C-j>',     '<C-w>j', {silent = true})
utils.map('n', '<C-k>',     '<C-w>k', {silent = true})
utils.map('n', '<C-l>',     '<C-w>l', {silent = true})


-- Buffer resizing
utils.map('n', '<M-left>',  '<cmd>vertical resize -2<CR>', {silent = true})
utils.map('n', '<M-right>', '<cmd>vertical resize +2<CR>', {silent = true})
utils.map('n', '<M-down>',  '<cmd>resize +2<CR>', {silent = true})
utils.map('n', '<M-up>',    '<cmd>resize -2<CR>', {silent = true})

utils.map('n', '<M-h>',     '<cmd>vertical resize -2<CR>', {silent = true})
utils.map('n', '<M-l>',     '<cmd>vertical resize +2<CR>', {silent = true})
utils.map('n', '<M-j>',     '<cmd>resize +2<CR>', {silent = true})
utils.map('n', '<M-k>',     '<cmd>resize -2<CR>', {silent = true})


-- Better indenting
utils.map('v', '<',         '<gv', opts)
utils.map('v', '>',         '>gv', opts)

utils.map('n', '<',         '<<', opts)
utils.map('n', '>',         '>>', opts)

-- TAB and SHIFT TAB will cycle through buffers
utils.map('n', '<TAB>',     ':bnext<CR>', opts)
utils.map('n', '<S-TAB>',   ':bprev<CR>', opts)
utils.map('n', '<Leader><Leader>',   '<C-^>', opts)


-- Deleting and Pasting
utils.map('n', 'ss',        '"_dd', opts)
utils.map('n', 's',         '"_d', opts)
utils.map('n', 'S',         '"_D', opts)
utils.map('n', '<Leader>p', '"0p', opts)
utils.map('n', '<Leader>P', '"0p', opts)


-- Moving text up and down in visual selection
utils.map('v', '<S-up>',    ":m-2<CR>gv=gv", opts)
utils.map('v', '<S-down>',  ":m+1<CR>gv=gv", opts)
utils.map('v', '<S-k>',     ":m-2<CR>gv=gv", opts)
utils.map('v', '<S-j>',     ":m+1<CR>gv=gv", opts)

utils.map('n', '<S-up>',    ":m-2<cr>==", opts)
utils.map('n', '<S-down>',  ":m+1<cr>==", opts)
utils.map('n', '<Leader>k', ':m-2<cr>==', opts)
utils.map('n', '<Leader>j', ':m+<cr>==', opts)

utils.map('v', 'p', '"_dP', opts)

-- Start and end of line
utils.map('n', '<S-left>',  "^", opts)
utils.map('n', '<S-Right>', "$", opts)
utils.map('n', '<S-h>',     "^", opts)
utils.map('n', '<S-l>',     "$", opts)

vim.cmd [[
    command! Vimrc :vs $MYVIMRC
]]

