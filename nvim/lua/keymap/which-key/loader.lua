-- This module loads all the key mappings dynamically from the groups directory
local M = {}

function M.load_groups(...)
    -- Optional: Accept initial mappings_by_mode
    local init = ... or {}  -- accepts a table: { n = {...}, v = {...}, ... }
    local mappings_by_mode = vim.tbl_deep_extend("force", {}, init)

    local groups_path = vim.fn.stdpath("config") .. "/lua/keymap/which-key/groups"
    local files = vim.fn.glob(groups_path .. "/*.lua", false, true)

    for _, file in ipairs(files) do
        local filename = vim.fn.fnamemodify(file, ":t:r")
        local ok, group_mappings = pcall(require, "keymap.which-key.groups." .. filename)
        if ok then
            local modes = group_mappings.modes or { "n" }
            for _, mode in ipairs(modes) do
                mappings_by_mode[mode] = mappings_by_mode[mode] or {}
                mappings_by_mode[mode][group_mappings.key] = group_mappings.mapping -- mapping not mappings!
            end
        else
            vim.notify("Failed to load group: " .. filename, vim.log.levels.WARN)
        end
    end

    return mappings_by_mode
end

return M
