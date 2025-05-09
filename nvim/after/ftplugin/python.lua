-- Python specific settings
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.textwidth = 88  -- Match Black formatter default

-- Set the Python indentation style
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

-- Configure formatters
-- Black and Ruff should already be configured in the LSP config