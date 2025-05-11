local M = {}

function M.load_groups()
	local all_mappings = {}

	-- folder for your split mapping files
	local groups_path = vim.fn.stdpath("config") .. "/lua/keymap/which-key/groups"
	local files = vim.fn.glob(groups_path .. "/*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		local ok, group_mappings = pcall(require, "keymap.which-key.groups." .. filename)
		if ok and type(group_mappings) == "table" then
			for _, map in ipairs(group_mappings) do
				table.insert(all_mappings, map)
			end
		else
			vim.notify("Failed to load group: " .. filename, vim.log.levels.WARN)
		end
	end

	return all_mappings
end

return M
