vim.api.nvim_set_keymap(
  'n',
  '<C-b>',
  ':NvimTreeToggle<CR>',
  {noremap = true, silent = true}
)
vim.cmd [[
  augroup AutoClose
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]]
