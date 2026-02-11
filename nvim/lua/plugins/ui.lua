return {
	-- Colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				sidebars = {
					"qf",
					"vista_kind",
					"terminal",
					"packer",
					"spectre_panel",
					"NeogitStatus",
					"help",
				},
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
				use_background = true,
				on_highlights = function(hl, c)
					hl.IndentBlanklineContextChar = { fg = c.dark5 }
					hl.TSConstructor = { fg = c.blue1 }
					hl.TSTagDelimiter = { fg = c.dark5 }
				end,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"AndreM222/copilot-lualine",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "palenight", --tokyonight
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = {
						{
							function()
								local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
								local clients = vim.lsp.get_clients({ bufnr = 0 })
								if next(clients) == nil then
									return "" --"No Active LSP"
								end
								local client_names = {}
								for _, client in ipairs(clients) do
									if client.name ~= "null-ls" then
										table.insert(client_names, client.name)
									end
								end
								if #client_names == 0 then
									return "" --"No Active LSP"
								end
								return "[" .. table.concat(client_names, ", ") .. "]"
							end,
							-- icon = " ",
							color = { fg = "#7aa2f7" }, --, gui = "bold"
						},
						{
							"copilot",
							-- Default values
							symbols = {
								status = {
									icons = {
										enabled = " ",
										sleep = " ", -- auto-trigger disabled
										disabled = " ",
										warning = " ",
										unknown = "", --" ",
									},
									hl = {
										enabled = "#50FA7B",
										sleep = "#50FA7B", --"#AEB7D0",
										disabled = "#6272A4",
										warning = "#FFB86C",
										unknown = "#6272A4", --"#FF5555",
									},
								},
								spinners = "dots", -- has some premade spinners
								-- spinner_color = "#50FA7B",
							},
							show_colors = true,
							show_loading = false,
						},
						"encoding",
						"fileformat",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					sort_by = "directory",
					numbers = "none",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					max_name_length = 30,
					max_prefix_length = 30,
					tab_size = 21,
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false,
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thin",
					enforce_regular_tabs = false,
					always_show_bufferline = true,
				},
				highlights = {
					fill = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					background = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					buffer_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					close_button = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					close_button_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					tab_selected = {
						fg = { attribute = "fg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
					tab = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					tab_close = {
						fg = { attribute = "fg", highlight = "TabLineSel" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
					duplicate_selected = {
						fg = { attribute = "fg", highlight = "TabLineSel" },
						bg = { attribute = "bg", highlight = "TabLineSel" },
						italic = true,
					},
					duplicate_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
						italic = true,
					},
					duplicate = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
						italic = true,
					},
					modified = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					modified_selected = {
						fg = { attribute = "fg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
					modified_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					separator = {
						fg = { attribute = "bg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					separator_selected = {
						fg = { attribute = "bg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
					indicator_selected = {
						fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
				},
			})
		end,
	},

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					adaptive_size = true,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				actions = {
					open_file = {
						resize_window = true,
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
		end,
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				scope = {
					enabled = true,
					show_start = false, -- removes the top underline
					show_end = false, -- removes the bottom underline
				},
			})
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Highlight current word
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 100,
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
					"NvimTree",
				},
				under_cursor = true,
				min_count_to_highlight = 1,
			})
		end,
	},

	-- Tailwind CSS tools
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			server = {
				override = false,
			},
		}, -- your configuration
	},
}
