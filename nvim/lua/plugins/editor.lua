return {
  -- Alpha (dashboard)
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      
      -- Configure the dashboard header (migrated from LunarVIM)
      dashboard.section.header.val = {
        [[            /$$$$$$   ]],
        [[           /$$__  $$  ]],
        [[  /$$$$$$ | $$  \ $$  ]],
        [[ |____  $$| $$$$$$$$  ]],
        [[  /$$$$$$$| $$__  $$  ]],
        [[ /$$__  $$| $$  | $$  ]],
        [[|  $$$$$$$| $$  | $$  ]],
        [[ \_______/|__/  |__/  ]],
        [[                      ]],
        [[     pay yo billz     ]],
      }
      
      -- Configure dashboard buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }
      
      alpha.setup(dashboard.opts)
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  
  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },
  
  -- Treesitter (syntax)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "lua", "vim", "vimdoc", "javascript", "typescript", "html", "css" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  
  -- Harpoon (file navigation)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      
      -- Basic keymaps for harpoon
      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      
      -- Nav keymaps
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
      
      -- Telescope integration
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
      
      -- Telescope Harpoon
      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })
    end,
  },
  
  -- Trouble (diagnostics)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        mode = "document_diagnostics",
        use_diagnostic_signs = true,
      })
      
      -- Keymaps
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
    end,
  },
  
  -- TMUX Navigator
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
  
  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
      
      -- Remaps for the refactoring operations
      vim.keymap.set("v", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
      vim.keymap.set("v", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
      vim.keymap.set("v", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
      vim.keymap.set("v", "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
    end,
  },
  
  -- Glow (markdown preview)
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  
  -- VimTex
  {
    "lervag/vimtex",
  },
  
  -- Duckytype
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
  
  -- ThePrimeagen's vim-be-good (for practice)
  {
    "ThePrimeagen/vim-be-good",
  },
}