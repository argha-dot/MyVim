local opts = { noremap = true, silent = true }

if vim.g.neovide then
	vim.o.guifont = "Monofur Nerd Font Mono:h10"
	vim.g.neovide_refresh_rate = 30
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = false
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_unlink_border_highlights = true
	vim.g.neovide_scroll_animation_length = 0

	vim.keymap.set("n", "<F11>", "<cmd>lua Fullscreen()<CR>", opts)
end

function Fullscreen()
	if not vim.g.neovide_fullscreen then
		vim.g.neovide_fullscreen = true
	else
		vim.g.neovide_fullscreen = false
	end
end
