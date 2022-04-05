local utils = require("utils")

function Scratch()
  vim.cmd [[
    vsplit
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    file scratch
  ]]
end

vim.cmd [[
  command! Scratch lua Scratch()<cr>
]]
