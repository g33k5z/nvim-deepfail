--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.g.transparent_background = true
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }


-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "python" } --"comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
-- local null_ls = require("null-ls")



local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }


--   {
--     name = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespace
--     -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
--     args = { "--print-width", "100" },
--     ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
--     -- filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { name = "pyright" },
--   {
--     name = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }



-- lvim.builtin.which_key.mappings["l"]["f"] = {
--   function()
--     require("lvim.lsp.utils").format { timeout_ms = 2000 }
--   end,
--   "Format",
-- }

-- Setup mason-null-ls and null-ls
-- local null_ls = require("null-ls")
-- local mason_null_ls = require("mason-null-ls")

-- mason_null_ls.setup({
--   ensure_installed = { "black" },
--   automatic_installation = true,
-- })

-- null-ls setup
-- require("mason-null-ls").setup({
--   ensure_installed = { "black" }
-- })

-- local null_ls = require("null-ls")

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.black,
--   },
-- })
-- require("mason").setup()
-- require("null-ls").setup()

-- require("mason-null-ls").setup({
--   ensure_installed = nil,
--   automatic_installation = true,
-- })
-- -- Setup mason-null-ls and null-ls
-- local null_ls = require("null-ls")
-- local mason_null_ls = require("mason-null-ls")

-- mason_null_ls.setup({
--   ensure_installed = { "black" },
--   automatic_installation = true,
-- })


-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     exe = "eslint",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
-- lvim.plugins = {
--   {
--     "folke/trouble.nvim",
--     cmd = "TroubleToggle",
--   },
-- }
lvim.plugins = {
  {
    "folke/trouble.nvim",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    -- config = function()
    --   require("your.null-ls.config") -- require your null-ls config here (example below)
    -- end,
  },
  {
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup {
        auto_display = true -- WIP automatic markdown image display, may be prone to breaking
      }
    end
  },
  {
    'kwakzalver/duckytype.nvim',
    config = function()
      require('duckytype').setup {
        number_of_words = 10,
        highlight = {
          good = "Comment",
          bad = "Exception",
          remaining = "Label",
        },
      }
    end
  },
  { 'ThePrimeagen/vim-be-good' },
  -- { 'ThePrimeagen/harpoon' },
  -- { 'ThePrimeagen/git-worktree.nvim' },
  -- { 'ThePrimeagen/telescope-harpoon.nvim' },
  -- { 'ThePrimeagen/git-worktree.nvim' },
  -- { 'ThePrimeagen/telescope-fzf-native.nvim' },
  -- { 'ThePrimeagen/telescope-ghq.nvim' },
  -- { 'ThePrimeagen/telescope-tmux' },
  {
    "folke/lsp-trouble.nvim",
    -- requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        --edluffy/hologramedluffy/hologramedluffy/hologram your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  -- {
  --   "ellisonleao/glow.nvim",
  --   config = function()
  --     require("glow").setup()
  --   end
  -- },
  -- You must install glow globally
  -- https://github.com/charmbracelet/glow
  -- yay -S glow
  -- {
  --   "npxbr/glow.nvim",
  --   ft = { "markdown" }
  --   -- build = "yay -S glow"
  -- },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
  {
    'lervag/vimtex'
  },
  {
    'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'BurntSushi/ripgrep'
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end
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
      "nvim-telescope/telescope.nvim"
    }
  },
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
}


local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)


lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

local harpoon = require('harpoon')
harpoon:setup({})



-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })

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
