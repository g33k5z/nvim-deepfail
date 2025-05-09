-- Core Neovim options
local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.number = true         -- Show current line number

-- Indentation
opt.tabstop = 2           -- Number of spaces tabs count for
opt.shiftwidth = 2        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.smartindent = true    -- Insert indents automatically
opt.wrap = false          -- Don't wrap lines

-- Appearance
opt.termguicolors = true  -- True color support
opt.signcolumn = "yes"    -- Always show the signcolumn
opt.cmdheight = 1         -- Height of command line
opt.pumheight = 10        -- Maximum number of entries in popup menu
opt.showmode = false      -- Don't show mode since we have a statusline

-- Behavior
opt.hidden = true         -- Enable background buffers
opt.ignorecase = true     -- Ignore case
opt.smartcase = true      -- Don't ignore case with capitals
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.timeoutlen = 300      -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 250      -- Faster completion
opt.mouse = "a"           -- Enable mouse mode
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Disable transparent background from LunarVIM config
--[[
vim.cmd([=[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]=])
--]]