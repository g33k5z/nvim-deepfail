local M = {}

function M.register_groups()
	local wk = require("which-key")
	local group_loader = require("keymap.which-key.loader") -- or the module where your code lives
	local all_mappings = group_loader.load_groups()
	wk.add(all_mappings)
end

return M
