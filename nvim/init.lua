-- Entry point for Neovim configuration
-- Author: g33k5z
-- Migrated from LunarVIM

-- Load core configurations
require('core.options')    -- Vim/Neovim options
require('core.appearance') -- UI settings
require('core.keymaps')    -- Basic keymappings
require('core.lazy')       -- Plugin manager
require("lsp.lsp")         -- LSP configuration
-- The rest is loaded via lazy.nvim
