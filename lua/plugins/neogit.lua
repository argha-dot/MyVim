return {
	"TimUntersberger/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"Neogit",
	},
	config = function()
		require("neogit").setup({})
		vim.keymap.set("n", "<leader>gN", "<cmd>Neogit<CR>", { desc = "Open [g]it [N]eogit" })
	end,
}
