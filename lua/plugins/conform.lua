local slow_format_filetypes = {}

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

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
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
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
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
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
			javascript = function()
				if require("conform").get_formatter_info("biome") then
					return { "biome" }
				else
					return { "prettierd", "prettier", "eslint_d" }
				end
			end,
			typescript = function()
				if require("conform").get_formatter_info("biome") then
					return { "biome" }
				else
					return { "prettierd", "prettier", "eslint_d" }
				end
			end,
			javascriptreact = function()
				if require("conform").get_formatter_info("biome") then
					return { "biome" }
				else
					return { "prettierd", "prettier", "eslint_d" }
				end
			end,
			typescriptreact = function()
				if require("conform").get_formatter_info("biome") then
					return { "biome" }
				else
					return { "prettierd", "prettier", "eslint_d" }
				end
			end,
			-- javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			-- typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
		},
		formatters = {},
	},
}
