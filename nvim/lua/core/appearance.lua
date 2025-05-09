-- Appearance settings
local api = vim.api

-- Set custom highlight for dashboard header (from LunarVIM config)
api.nvim_set_hl(0, "AlphaHeader", { fg = "#A6E22E" }) -- Bright Green

-- Transparent background (optional)
-- Uncomment these lines if you want transparent background
--[[
vim.cmd([=[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]=])
--]]