return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[B]buffer [F]ormat",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		format_after_save = {
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			rust = { "rustfmt" },
			javascript = { { "prettierd", "prettier" }, "eslint_d" },
			javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			typescript = { { "prettierd", "prettier" }, "eslint_d" },
			typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			gleam = { "gleam" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
		},
		formatters = {},
	},
}
