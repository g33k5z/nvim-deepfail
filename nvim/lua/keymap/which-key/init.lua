return 
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local which_key = require("which-key")

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
        -- v3+ options
        replace = {}, -- replaces 'key_labels'
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        keys = {    -- replaces 'popup_mappings'
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        -- win = {    -- replaces 'window'
        --   border = "single",
        --   position = "bottom",
        --   margin = { 1, 0, 1, 0 },
        --   padding = { 2, 2, 2, 2 },
        --   winblend = 0,
        -- },
        -- layout = {
        --   height = { min = 4, max = 25 },
        --   width = { min = 20, max = 50 },
        --   spacing = 3,
        --   align = "left",
        -- },
        -- filter = true, -- replaces 'ignore_missing' and 'hidden'
        show_help = true,
        show_keys = true,
        triggers = {"<leader>" },
        -- No more triggers_blacklist. If you want to blacklist, use triggers table above accordingly.
        disable = {
          buftypes = {},
          filetypes = { "TelescopePrompt" },
        },
        -- No more 'operators' table for description—use 'defer' if needed for ModeChanged triggers.
      })

    require("keymap.which-key.register").register_groups()
    end,
  }
