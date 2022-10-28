vim.cmd [[
  set path+=**
  set whichwrap+=<,>,[,],h,l"
]]

-- Markdown and LaTeX Settings
local wrap_line_and_spell_grp = vim.api.nvim_create_augroup("WrapLineAndSpell", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "markdown",
    command = "setlocal linebreak wrap spell",
    group = wrap_line_and_spell_grp
  }
)
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "tex",
    command = "setlocal linebreak wrap spell",
    group = wrap_line_and_spell_grp
  }
)

local no_rel_insert_grp = vim.api.nvim_create_augroup("NoRelInsert", { clear = true })
-- vim.api.nvim_create_autocmd(
--   "InsertEnter",
--   {
--     command = "norm zz",
--     group = no_rel_insert_grp,
--     pattern = "*"
--   }
-- )
vim.api.nvim_create_autocmd(
  "InsertEnter",
  {
    command = "set norelativenumber",
    group = no_rel_insert_grp,
    pattern = "*"
  }
)
vim.api.nvim_create_autocmd(
  "InsertLeave",
  {
    command = "set relativenumber",
    group = no_rel_insert_grp,
    pattern = "*"
  }
)

local highlight_yank_grp = vim.api.nvim_create_augroup('YankHighlight', { clear = true } )
vim.api.nvim_create_autocmd(
  'TextYankPost',
  {
    callback = function ()
      vim.highlight.on_yank()
    end,
    group = highlight_yank_grp,
    pattern = "*"
  }
)

local cursor_line_grp = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd(
  { 'InsertLeave', "WinEnter" },
  {
    command = "set cursorline",
    group = cursor_line_grp,
    pattern = "*"
  }
)
vim.api.nvim_create_autocmd(
  { 'InsertEnter', "WinLeave" },
  {
    command = "set nocursorline",
    group = cursor_line_grp,
    pattern = "*"
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    command = [[ set formatoptions-=cro ]]
  }
)
