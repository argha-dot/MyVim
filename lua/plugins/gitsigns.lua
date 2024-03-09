function NextHunk()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		require("gitsigns").next_hunk()
	end)

	return "<Ignore>"
end
vim.keymap.set("n", "<leader>gn", "<cmd>lua NextHunk()<CR>", { desc = "[G]oto [N]ext Hunk" })
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review Hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[G]it [R]eset Hunk" })
vim.keymap.set("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "[G]it [R]eset Buffer" })

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufRead", "BufNewFile" },
	opts = {
		signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
		numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "    <author>, <author_time:%Y-%m-%d> - <summary>",
	},
}
