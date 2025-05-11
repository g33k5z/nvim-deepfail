-- This module loads all the key mappings dynamically from the groups directory

local M = {}

function M.load_groups(mappings)
    -- Load all mapping groups dynamically from the groups directory
    local groups_path = vim.fn.stdpath("config") .. "/lua/keymap/which-key/groups"
    local files = vim.fn.glob(groups_path .. "/*.lua", false, true)
    
    for _, file in ipairs(files) do
        -- Extract filename without extension
        local filename = vim.fn.fnamemodify(file, ":t:r")
        
        -- Load the group
        local ok, group_mappings = pcall(require, "keymap.which-key.groups." .. filename)
        if ok then
            mappings[group_mappings.key] = group_mappings.mapping
        else
            vim.notify("Failed to load group: " .. filename, vim.log.levels.WARN)
        end
    end
    
    return mappings
end

return M
