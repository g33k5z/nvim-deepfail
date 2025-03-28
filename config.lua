-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny




-- ~/.config/lvim/config.lua

-- Make sure alpha is enabled (it usually is by default)
lvim.builtin.alpha.active = true

-- Configure the dashboard header
lvim.builtin.alpha.dashboard.section.header.val = {
    [[            /$$$$$$   ]], -- Using Lua long strings [[...]] is often easier for ASCII art
    [[           /$$__  $$  ]],
    [[  /$$$$$$ | $$  \ $$  ]],
    [[ |____  $$| $$$$$$$$  ]],
    [[  /$$$$$$$| $$__  $$  ]],
    [[ /$$__  $$| $$  | $$  ]],
    [[|  $$$$$$$| $$  | $$  ]],
    [[ \_______/|__/  |__/  ]],
    [[                      ]], -- Optional: Add a blank line for spacing
    [[     pay yo billz     ]], -- Optional: Add a blank line for spacing
}

-- Optional: Add color to the header (Example: Green)
-- Place this somewhere in your config.lua, outside the lvim.builtin.alpha table
-- Using vim.api (recommended)
vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#A6E22E" }) -- Bright Green

-- Or using vim.cmd
-- vim.cmd("highlight AlphaHeader guifg=#A6E22E ctermfg=118") -- GUI and Terminal Green

-- ... other configurations in your config.lua ...




-- Enable relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true -- Keep the current line number absolute

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "python" } --"comment", "markdown_inline", "regex" }

-- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup({
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})

nvim_lsp.ts_ls.setup({
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	single_file_support = false,
})

lvim.lsp.installer.setup.ensure_installed = {
	"pyright",
}

require("lspconfig").pyright.setup({
	on_attach = require("lvim.lsp").common_on_attach,
	capabilities = require("lvim.lsp").common_capabilities(),
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "black" },
	{
		name = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespace
		-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
		args = { "--print-width", "100" },
		---@usage only start in these filetypes, by default it will attach to all filetypes it supports
		filetypes = { "typescript", "typescriptreact", "html" },
	},
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "html" })
local opts = {
	filetypes = { "html", "htmldjango" },
}

require("lvim.lsp.manager").setup("html", opts)
lvim.plugins = {
	-- {
	-- 	"docholiday", -- plugin name
	-- 	dir = "~/.docholiday", -- local path
	-- 	config = function()
	-- 		require("docstring-toggle").setup({
	-- 			-- your config here
	-- 		})
	-- 	end,
	-- },
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim", -- Corrected from "none-ls.nvim" to "null-ls.nvim"
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua" }, -- Automatically ensure stylua is installed
				automatic_installation = true, -- Auto install configured formatters and linters
			})

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
	-- {
	--   "edluffy/hologram.nvim",
	--   config = function()
	--     require("hologram").setup({
	--       auto_display = true, -- WIP automatic markdown image display
	--     })
	--   end,
	-- },
	{
		"kwakzalver/duckytype.nvim",
		config = function()
			require("duckytype").setup({
				number_of_words = 10,
				highlight = {
					good = "Comment",
					bad = "Exception",
					remaining = "Label",
				},
			})
		end,
	},
	{ "ThePrimeagen/vim-be-good" },
	-- { 'ThePrimeagen/harpoon' },
	-- { 'ThePrimeagen/git-worktree.nvim' },
	-- { 'ThePrimeagen/telescope-harpoon.nvim' },
	-- { 'ThePrimeagen/git-worktree.nvim' },
	-- { 'ThePrimeagen/telescope-fzf-native.nvim' },
	-- { 'ThePrimeagen/telescope-ghq.nvim' },
	-- { 'ThePrimeagen/telescope-tmux' },
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				mode = "lsp_document_symbols", -- or "lsp_workspace_symbols" for workspace-level symbols
				-- auto_open = true,               -- Automatically open Trouble window when issues arise
				use_diagnostic_signs = true, -- Use icons from LSP for diagnostics
			})
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	{
		"lervag/vimtex",
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"BurntSushi/ripgrep",
	},
	-- local ok, copilot = pcall(require, "copilot")
	-- if not ok then
	-- 	return
	-- end

	-- copilot.setup({
	-- 	suggestion = {
	-- 		keymap = {
	-- 			accept = "<c-l>",
	-- 			next = "<c-j>",
	-- 			prev = "<c-k>",
	-- 			dismiss = "<c-h>",
	-- 		},
	-- 	},
	-- })

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			-- require("copilot").setup({})
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
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
					python = true,
					golang = true,
					[".mojo"] = true,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				openai_params = {
					model = "gpt-4o",
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
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {}, -- your configuration
	},

	"mfussenegger/nvim-dap-python",
	"nvim-neotest/neotest",
	"nvim-neotest/neotest-python",
}

local opts2 = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts2)

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- Add this section to your `config.lua` file
lvim.builtin.which_key.mappings.m = {
	name = "Harpoon",
	a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File" },
	m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
	["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "File 1" },
	["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "File 2" },
	["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "File 3" },
	["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "File 4" },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
