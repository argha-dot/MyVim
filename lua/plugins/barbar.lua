local utils = require("utils")
local opts = { noremap = true, silent = true }

-- Re-order to previous/next
utils.map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
utils.map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
utils.map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
utils.map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
utils.map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
utils.map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
utils.map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
utils.map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
utils.map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
utils.map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
utils.map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
utils.map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
utils.map('n', '<A-c>', ':BufferClose<CR>', opts)

vim.g.bufferlie = {
  animation = false,
  maximum_padding = 1,
}
