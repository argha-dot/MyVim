local utils = require("utils")

utils.map('n', '<C-p>', '<cmd>lua require("nabla").popup()<CR>', {noremap = true, silent = true})
