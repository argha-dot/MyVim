return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "TmuxNavigateLeft" },
		{ "<c-j>", "TmuxNavigateDown" },
		{ "<c-k>", "TmuxNavigateUp" },
		{ "<c-l>", "TmuxNavigateRight" },
	},
}
