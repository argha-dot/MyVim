local utils = require'utils'
local opts = {noremap = true, silent = true}


utils.map('n', '<Space>',   '<NOP>', opts)

-- To Prove that I'm a real vimmer
utils.map('n', '<Up>', '<Nop>', opts)
utils.map('n', '<Down>', '<Nop>', opts)
utils.map('n', '<Left>', '<Nop>', opts)
utils.map('n', '<Right>', '<Nop>', opts)

-- Leader Key
vim.g.mapleader = ' '

-- No Highlight
utils.map('n', '<Esc>',     ':noh<CR>', opts)

-- Break Lines
utils.map('n', 'Z', 'R<CR><Esc>', opts)

-- I hate Esc
utils.map('i', '<C-c>',     '<esc>', opts)
utils.map('v', '<C-c>',     '<esc>', opts)


-- Better buffer moving
utils.map('n', '<C-h>',     '<C-w>h', {silent = true})
utils.map('n', '<C-j>',     '<C-w>j', {silent = true})
utils.map('n', '<C-k>',     '<C-w>k', {silent = true})
utils.map('n', '<C-l>',     '<C-w>l', {silent = true})


-- Buffer resizing
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


utils.map('i', '<space>', '<C-g>u<space>', opts)

-- Deleting and Pasting
utils.map('n', 'ss',        '"_dd', opts)
utils.map('n', 's',         '"_d', opts)
utils.map('n', 'S',         '"_D', opts)
utils.map('n', '<Leader>p', '"0p', opts)
utils.map('n', '<Leader>P', '"0P', opts)

-- Better J
utils.map("n", "J", "mzJ`z", opts)


-- Better n, N
utils.map('n', 'n', 'nzzzv', opts)
utils.map('n', 'N', 'Nzzzv', opts)


-- replace Q Ex mode to last macro
utils.map('n', 'Q', '@@', opts)


-- Moving text up and down in visual selection
utils.map('v', '<S-k>',     ":m '<-2<CR>gv=gv", opts)
utils.map('v', '<S-j>',     ":m '>+1<CR>gv=gv", opts)

-- Start and end of line
utils.map('n', '<S-h>',     "^", opts)
utils.map('n', '<S-l>',     "$", opts)

utils.map('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {noremap = true})
