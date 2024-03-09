return {
	"norcalli/nvim-colorizer.lua",
	ft = { "html", "css", "sass", "vim", "typescript", "typescriptreact", "scss", "javascript", "javascriptreact" },
	config = function()
		require("colorizer").setup({
			"*",
		})
	end,
}
