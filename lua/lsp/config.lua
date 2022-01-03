local utils = require 'utils'

local opts = { noremap=true, silent=true }

utils.map('n', 'gD',        '<cmd>  lua vim.lsp.buf.declaration()<CR>', opts)
utils.map('n', 'gd',        '<cmd>  lua vim.lsp.buf.definition()<CR>', opts)
utils.map('n', 'gi',        '<cmd>  lua vim.lsp.buf.implementation()<CR>', opts)
utils.map('n', 'gr',        '<cmd>  lua vim.lsp.buf.references()<CR>', opts)
utils.map('n', 'gr',        '<cmd>  lua vim.lsp.buf.references()<CR>', opts)
utils.map('n', '[d',        '<cmd>  lua vim.diagnostic.goto_prev()<CR>', opts)
utils.map('n', ']d',        '<cmd>  lua vim.diagnostic.goto_next()<CR>', opts)
utils.map('n', 'K',         '<cmd>  lua vim.lsp.buf.hover()<CR>', opts)
utils.map('n', '<C-k>',     '<cmd>  lua vim.lsp.buf.signature_help()<CR>', opts)
utils.map('n', '<space>rn', '<cmd>  lua vim.lsp.buf.rename()<CR>', opts)
utils.map('n', '<space>ca', '<cmd>  lua vim.lsp.buf.code_action()<CR>', opts)
utils.map('n', '<space>e',  '<cmd>  lua vim.diagnostic.open_float()<CR>', opts)
