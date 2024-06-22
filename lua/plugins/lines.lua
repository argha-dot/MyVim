vim.o.laststatus = 3

return {
	{
		"b0o/incline.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				requires = "neovim/nvim-lspconfig",
				opts = {
					icons = {
						File = " ",
						Module = " ",
						Namespace = " ",
						Package = " ",
						Class = " ",
						Method = " ",
						Property = " ",
						Field = " ",
						Constructor = " ",
						Enum = " ",
						Interface = " ",
						Function = " ",
						Variable = " ",
						Constant = " ",
						String = " ",
						Number = " ",
						Boolean = " ",
						Array = " ",
						Object = " ",
						Key = " ",
						Null = " ",
						EnumMember = " ",
						Struct = " ",
						Event = " ",
						Operator = " ",
						TypeParameter = " ",
					},
				},
			},
		},
		event = "VeryLazy",
		config = function()
			local devicons = require("nvim-web-devicons")
			local helpers = require("incline.helpers")
			local navic = require("nvim-navic")

			require("incline").setup({
				window = {
					padding = 0,
					margin = {
						horizontal = 0,
						vertical = 0,
					},
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end

					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified

					local res = {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						guibg = "#44406e",
					}

					if props.focused then
						local len = #(navic.get_data(props.buf) or {})
						for i, item in ipairs(navic.get_data(props.buf) or {}) do
							local title = #item.name > 20 and string.sub(item.name, 1, 17) .. "..." or item.name
							if i <= 2 then
								table.insert(res, {
									{ " > ", group = "NavicSeparator" },
									{ item.icon, group = "NavicIcons" .. item.type },
									{ title, group = "NavicText" },
								})
							end

							if i == 3 and len >= 5 then
								table.insert(res, {
									{ " > ", group = "NavicSeparator" },
									{ "..", group = "NavicText" },
								})
							end

							if i > len - 2 and len >= 3 then
								table.insert(res, {
									{ " > ", group = "NavicSeparator" },
									{ item.icon, group = "NavicIcons" .. item.type },
									{ title, group = "NavicText" },
								})
							end
						end
					end

					table.insert(res, " ")
					return res
				end,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = "｜",
				section_separators = {},
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"branch",
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						shorting_target = 40,
					},
					"diff",
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", left_padding = 0 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		},
	},
}
