return {
	-- LSP Configuration & Plugins
	{
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "mason-org/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				opts = {},
			},

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		config = function()
			-- Setup neodev for better Lua development
			require("neodev").setup()

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Define on_attach function for keymaps and other LSP customizations
			local on_attach = function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			-- Mason & Mason-lspconfig setup
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				max_concurrent_installers = 4,
				log_level = vim.log.levels.INFO,
				-- Simplified configuration to avoid registry issues
				registries = {},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ruff",
					"lua_ls",
					"html",
					"ts_ls",
					"denols",
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
						})
					end,

					-- Override handlers for specific servers
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							on_attach = on_attach,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
									workspace = {
										library = {
											[vim.fn.expand("$VIMRUNTIME/lua")] = true,
											[vim.fn.stdpath("config") .. "/lua"] = true,
										},
									},
									telemetry = { enable = false },
								},
							},
						})
					end,

					-- ["ts_ls"] = function()
					-- 	lspconfig.ts_ls.setup({
					-- 		capabilities = capabilities,
					-- 		on_attach = on_attach,
					-- 		-- any specific options for typescript-tools here
					-- 	})
					-- end,
					["tsserver"] = function()
						lspconfig.tsserver.setup({
							capabilities = capabilities,
							on_attach = on_attach,
							root_dir = lspconfig.util.root_pattern("package.json"),
							single_file_support = false,
						})
					end,
					["denols"] = function()
						lspconfig.denols.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
						})
					end,

					["html"] = function()
						lspconfig.html.setup({
							capabilities = capabilities,
							on_attach = on_attach,
							filetypes = { "html", "htmldjango" },
						})
					end,
				},
			})

			-- Language servers are now configured through mason-lspconfig handlers above

			-- Diagnostics configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							buffer = "[Buf]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
			})
		end,
	},

	-- null-ls for linting and formatting
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "black", "ruff", "prettier" },
				automatic_installation = true,
			})

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black.with({
						extra_args = { "--line-length", "88" },
					}),
					null_ls.builtins.diagnostics.ruff,
					null_ls.builtins.formatting.prettier.with({
						extra_args = { "--print-width", "100" },
						filetypes = { "typescript", "typescriptreact", "html" },
					}),
				},
			})
		end,
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- UI setup
			dapui.setup()

			-- Auto open/close dapui
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Python setup
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
			require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

			-- Keymaps
			vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue" })
			vim.keymap.set("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
			vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
			vim.keymap.set("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
			vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate" })
			vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle UI" })
		end,
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
						runner = "pytest",
					}),
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>tt", function()
				require("neotest").run.run()
			end, { desc = "Run Test" })
			vim.keymap.set("n", "<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Run File" })
			vim.keymap.set("n", "<leader>td", function()
				require("neotest").run.run({ strategy = "dap" })
			end, { desc = "Debug Test" })
			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").summary.toggle()
			end, { desc = "Toggle Summary" })
			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open()
			end, { desc = "Open Output" })
		end,
	},
}
