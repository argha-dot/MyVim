-- Markdown and LaTeX Settings
local wrap_line_and_spell_grp = vim.api.nvim_create_augroup("WrapLineAndSpell", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal linebreak wrap spell",
	group = wrap_line_and_spell_grp,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	command = "setlocal linebreak wrap spell",
	group = wrap_line_and_spell_grp,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- On insert enter, center the line, switch from relative to norelative and the reverse
local no_rel_insert_grp = vim.api.nvim_create_augroup("NoRelInsert", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	command = "norm zz",
	group = no_rel_insert_grp,
	pattern = "*",
})
vim.api.nvim_create_autocmd("InsertEnter", {
	command = "set norelativenumber",
	group = no_rel_insert_grp,
	pattern = "*",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	command = "set relativenumber",
	group = no_rel_insert_grp,
	pattern = "*",
})

-- Stop vim from putting comments in front of new line
vim.api.nvim_create_autocmd("BufEnter", {
	command = [[ set formatoptions-=cro ]],
})

-- Cursorline highlighting control
--  Only have it on in the active buffer
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

