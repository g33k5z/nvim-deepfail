return {
	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local which_key = require("which-key")

			-- Setup which-key
			which_key.setup({
				plugins = {
					marks = false,
					registers = false,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
					presets = {
						operators = false,
						motions = false,
						text_objects = false,
						windows = false,
						nav = false,
						z = false,
						g = false,
					},
				},
				operators = { gc = "Comments" },
				key_labels = {},
				icons = {
					breadcrumb = "»",
					separator = "➜",
					group = "+",
				},
				popup_mappings = {
					scroll_down = "<c-d>",
					scroll_up = "<c-u>",
				},
				window = {
					border = "single",
					position = "bottom",
					margin = { 1, 0, 1, 0 },
					padding = { 2, 2, 2, 2 },
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "left",
				},
				ignore_missing = true,
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
				show_help = true,
				show_keys = true,
				triggers = "auto",
				triggers_blacklist = {
					i = { "j", "k" },
					v = { "j", "k" },
				},
				disable = {
					buftypes = {},
					filetypes = { "TelescopePrompt" },
				},
			})

			-- Load all mapping groups
			local mappings = {
				-- Single key mappings
				[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
				["w"] = { "<cmd>w!<CR>", "Save" },
				["q"] = { "<cmd>confirm q<CR>", "Quit" },
				["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
				["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
				["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
				["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
				["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
			}

			-- Load group mappings from separate files
			local group_loader = require("keymap.which-key.loader")
			mappings = group_loader.load_groups(mappings)

			-- Visual mode mappings
			local vmappings = require("keymap.which-key.vmappings")

			local opts = {
				mode = "n",
				prefix = "<leader>",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = true,
			}

			local vopts = {
				mode = "v",
				prefix = "<leader>",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = true,
			}

			which_key.register(mappings, opts)
			which_key.register(vmappings, vopts)
		end,
	}
}