function Scratch()
  vim.cmd [[
    vsplit
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal spell
    setlocal wrap
    setlocal breakindent
    file scratch
  ]]
end

vim.cmd [[
  command! Scratch lua Scratch()<cr>
]]
