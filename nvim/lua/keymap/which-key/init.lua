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

      local which_key = require("which-key")
      local group_loader = require("keymap.which-key.loader")

      -- Your single mappings (not groups)
      local single_nmappings = require("keymap.which-key.single_mappings")
      local single_vmappings = {
          ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
      }

      local init = {
          n = single_nmappings,
          v = single_vmappings,
      }

      -- mappings_by_mode: { n = {...}, v = {...}, ... }
      local mappings_by_mode = group_loader.load_groups(init)

      for mode, tbl in pairs(mappings_by_mode) do
          which_key.register(tbl, {
              mode = mode,
              prefix = "<leader>",
              silent = true,
              noremap = true,
              nowait = true,
          })
      end 
		end,
	},
}
