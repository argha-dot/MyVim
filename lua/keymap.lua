local utils = require'utils'

utils.map('n', '<Space>',   '<NOP>', {noremap = true, silent = true})

-- Leader Key
vim.g.mapleader = ' '


-- No Highlight
utils.map('n', '<Esc>',     ':noh<CR>', {noremap = true, silent = true})


-- I hate Esc
utils.map('i', '<C-c>',     '<esc>', {noremap = true, silent = true})
utils.map('v', '<C-c>',     '<esc>', {noremap = true, silent = true})


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
utils.map('v', '<',         '<gv', {noremap = true, silent = true})
utils.map('v', '>',         '>gv', {noremap = true, silent = true})

utils.map('n', '<',         '<<', {noremap = true, silent = true})
utils.map('n', '>',         '>>', {noremap = true, silent = true})

-- TAB and SHIFT TAB will cycle through buffers
utils.map('n', '<TAB>',     ':bnext<CR>', {noremap = true, silent = true})
utils.map('n', '<S-TAB>',   ':bprev<CR>', {noremap = true, silent = true})
utils.map('n', '<Leader><Leader>',   '<C-^>', {noremap = true, silent = true})


-- Deleting and Pasting
utils.map('n', 'ss',        '"_dd', {noremap = true, silent = true})
utils.map('n', 's',         '"_d', {noremap = true, silent = true})
utils.map('n', 'S',         '"_D', {noremap = true, silent = true})
utils.map('n', '<Leader>p', '"0p', {noremap = true, silent = true})
utils.map('n', '<Leader>P', '"0p', {noremap = true, silent = true})


-- Moving text up and down in visual selection
utils.map('v', '<S-up>',    ":m-2<CR>gv=gv", {noremap = true, silent = true})
utils.map('v', '<S-down>',  ":m+1<CR>gv=gv", {noremap = true, silent = true})
utils.map('v', '<S-k>',     ":m-2<CR>gv=gv", {noremap = true, silent = true})
utils.map('v', '<S-j>',     ":m+1<CR>gv=gv", {noremap = true, silent = true})

utils.map('n', '<S-up>',    ":m-2<cr>==", {noremap = true, silent = true})
utils.map('n', '<S-down>',  ":m+1<cr>==", {noremap = true, silent = true})
utils.map('n', '<Leader>k', ':m-2<cr>==', {noremap = true, silent = true})
utils.map('n', '<Leader>j', ':m+<cr>==', {noremap = true, silent = true})


-- Start and end of line
utils.map('n', '<S-left>',  "^", {noremap = true, silent = true})
utils.map('n', '<S-Right>', "$", {noremap = true, silent = true})
utils.map('n', '<S-h>',     "^", {noremap = true, silent = true})
utils.map('n', '<S-l>',     "$", {noremap = true, silent = true})

vim.cmd [[
    command! Vimrc :vs $MYVIMRC
]]

