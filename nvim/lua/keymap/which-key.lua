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

			-- Normal mode mappings with leader key
			local mappings = {
				[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
				["w"] = { "<cmd>w!<CR>", "Save" },
				["q"] = { "<cmd>confirm q<CR>", "Quit" },
				["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
				["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
				["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
				["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
				["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

				b = {
					name = "Buffers",
					j = { "<cmd>BufferLinePick<cr>", "Jump" },
					f = { "<cmd>Telescope buffers<cr>", "Find" },
					b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
					n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
					W = { "<cmd>noautocmd w<cr>", "Save without formatting" },
					e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
					h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
					l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
					D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
					L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
				},

				d = {
					name = "Debug",
					t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
					b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
					c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
					C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
					d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
					g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
					i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
					o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
					u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
					p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
					r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
					s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
					q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
					U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
				},

				p = {
					name = "Plugins",
					i = { "<cmd>Lazy install<cr>", "Install" },
					s = { "<cmd>Lazy sync<cr>", "Sync" },
					S = { "<cmd>Lazy clear<cr>", "Status" },
					c = { "<cmd>Lazy clean<cr>", "Clean" },
					u = { "<cmd>Lazy update<cr>", "Update" },
					p = { "<cmd>Lazy profile<cr>", "Profile" },
					l = { "<cmd>Lazy log<cr>", "Log" },
					d = { "<cmd>Lazy debug<cr>", "Debug" },
				},

				m = {
					name = "Mason", -- group name, shows as title in which-key
					m = { "<cmd>Mason<cr>", "Open Mason" },
					l = { "<cmd>MasonLog<cr>", "Mason Log" },
					u = { "<cmd>MasonUninstall<cr>", "Uninstall Package" },
					-- Add more Mason subcommands as you wish!
				},

				g = {
					name = "Git",
					g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
					j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
					k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
					l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
					L = { "<cmd>Gitsigns blame_line full=true<cr>", "Blame Line (full)" },
					p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
					r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
					R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
					s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
					u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
					o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
					b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
					c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
					C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
					d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
				},

				l = {
					name = "LSP",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer Diagnostics" },
					w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
					f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
					i = { "<cmd>LspInfo<cr>", "Info" },
					I = { "<cmd>Mason<cr>", "Mason Info" },
					j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
					k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
					l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
					q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
					r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
					e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
				},

				s = {
					name = "Search",
					b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
					c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
					H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
					M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
					R = { "<cmd>Telescope registers<cr>", "Registers" },
					t = { "<cmd>Telescope live_grep<cr>", "Text" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					C = { "<cmd>Telescope commands<cr>", "Commands" },
					l = { "<cmd>Telescope resume<cr>", "Resume last search" },
					p = {
						"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
						"Colorscheme with Preview",
					},
				},

				T = {
					name = "Treesitter",
					i = { ":TSConfigInfo<cr>", "Info" },
				},

				z = {
					name = "ChatGPT",
					c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
					e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
					g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
					t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
					k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
					d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
					a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
					o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
					s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
					f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
					x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
					r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
					l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
				},

				j = {
					name = "Copilot",
					c = { "<cmd>Copilot<CR>", "Copilot" },
				},

				t = {
					name = "Trouble",
					x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
					X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
					s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
					l = {
						"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
						"LSP Definitions / References / ... (Trouble)",
					},
					L = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
					Q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
				},

				r = {
					name = "Refactor",
					e = { ":Refactor extract<CR>", "Extract" },
					f = { ":Refactor extract_to_file<CR>", "Extract to file" },
					v = { ":Refactor extract_var<CR>", "Extract var" },
					i = { ":Refactor inline_var<CR>", "Inline var" },
					I = { ":Refactor inline_func<CR>", "Inline func" },
					b = { ":Refactor extract_block<CR>", "Extract block" },
					bf = { ":Refactor extract_block_to_file<CR>", "Extract block to file" },
				},

				h = {
					name = "Harpoon",
					a = { "<cmd>lua require('harpoon'):list():append()<CR>", "Add File" },
					m = { "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", "Menu" },
					["1"] = { "<cmd>lua require('harpoon'):list():select(1)<CR>", "File 1" },
					["2"] = { "<cmd>lua require('harpoon'):list():select(2)<CR>", "File 2" },
					["3"] = { "<cmd>lua require('harpoon'):list():select(3)<CR>", "File 3" },
					["4"] = { "<cmd>lua require('harpoon'):list():select(4)<CR>", "File 4" },
				},
			}

			-- Visual mode mappings with leader key
			local vmappings = {
				["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
				l = {
					name = "LSP",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				},
				g = {
					name = "Git",
					r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
					s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
				},
				r = {
					name = "Refactor",
					e = { ":Refactor extract<CR>", "Extract" },
					f = { ":Refactor extract_to_file<CR>", "Extract to file" },
					v = { ":Refactor extract_var<CR>", "Extract var" },
					i = { ":Refactor inline_var<CR>", "Inline var" },
				},
				z = {
					name = "ChatGPT",
					e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
					g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
					t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
					k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
					d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
					a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
					o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
					s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
					f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
					x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
					r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
				},
			}

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
	},
}
