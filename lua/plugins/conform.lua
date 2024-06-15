local slow_format_filetypes = {}

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
		format_on_save = function(bufnr)
			if slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			local function on_format(err)
				if err and err:match("timeout") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end

			return { timeout_ms = 200, lsp_fallback = true }, on_format
		end,
		format_after_save = function(bufnr)
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			return { lsp_fallback = true }
		end,
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
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
		},
		formatters = {},
	},
}
