return {
	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<C-l>",
						accept_word = false,
						accept_line = false,
						next = "<C-j>",
						prev = "<C-k>",
						dismiss = "<C-h>",
					},
				},
				filetypes = {
					-- yaml = false,
					-- markdown = false,
					-- help = false,
					-- gitcommit = false,
					-- gitrebase = false,
					-- hgcommit = false,
					-- svn = false,
					-- cvs = false,
					-- ["."] = false,
					-- python = true,
					-- golang = true,
					-- [".mojo"] = true,
					["*"] = true, -- Enable Copilot for all filetypes
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},

	-- ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				openai_params = {
					model = "gpt-4.1",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 4000,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				openai_edit_params = {
					model = "gpt-4o",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				use_openai_functions_for_edits = true,
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- ClaudeCode
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		-- Load eagerly (after UI) rather than on :ClaudeCode*, so the WebSocket
		-- server is up and selection tracking is live from the start -- including
		-- for a `claude` launched in an outside terminal. Swap back to a
		-- `cmd = { "ClaudeCode", ... }` list if the startup cost isn't worth it.
		event = "VeryLazy",
		opts = {
			-- terminal_cmd is left unset on purpose: it defaults to "claude" off
			-- PATH, which keeps this config portable across machines.
			auto_start = true,
			log_level = "warn", -- "info" chatters on every selection change
			focus_after_send = true,

			-- Passive context: broadcasts the current file (and the visual range,
			-- when there is one) on cursor/buffer/mode changes, so Claude tracks
			-- what you are looking at without an explicit :ClaudeCodeSend.
			track_selection = true,
			-- How long a visual selection survives after you leave visual mode.
			-- Bump this if selections go stale before you reach the terminal.
			visual_demotion_delay_ms = 50,

			terminal = {
				split_side = "right",
				split_width_percentage = 0.35,
				diff_split_width_percentage = 0.22, -- shrink the terminal while a diff is open
				provider = "auto", -- resolves to snacks, since it is a dependency
				auto_close = true,
				-- false: focusing the terminal leaves you in Normal mode, so the
				-- <C-h/j/k/l> window maps work and scroll position is kept.
				-- Press `i` to type at Claude. true traps you, because those maps
				-- are Normal-mode only.
				auto_insert = false,
			},

			diff_opts = {
				layout = "vertical",
				open_in_new_tab = false,
				keep_terminal_focus = false,
				auto_resize_terminal = true,
			},
		},
		config = true,
	},
}
