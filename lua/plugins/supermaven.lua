return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				clear_suggestion = "<C-x>",
			},
		})
	end,
}
