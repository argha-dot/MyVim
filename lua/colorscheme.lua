vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = false

-- if (vim.g.neovide) then
--   -- vim.g.tokyodark_transparent_background = false
--
--   vim.cmd [[
--     syntax on
--     colorscheme tokyodark
--   ]]
-- else
--   -- vim.g.tokyodark_transparent_background = true
--
--   vim.cmd [[
--     syntax on
--     colorscheme tokyodark
--   ]]
-- end

vim.cmd[[
  syntax on
  colorscheme tokyodark

  hi clear SignColumn
  hi clear CursorLine
  hi CursorLine cterm=underline gui=underline
  " hi Normal ctermbg=NONE guibg=NONE
  highlight VertSplit guibg=#ff000000
]]
