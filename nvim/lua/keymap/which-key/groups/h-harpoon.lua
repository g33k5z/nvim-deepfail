local function get_harpoon_desc(idx)
  local status_ok, harpoon = pcall(require, "harpoon")
  if not status_ok then
    return "File " .. idx .. " (no harpoon)"
  end
  local list = harpoon:list()
  local item = list and list.items and list.items[idx]
  return item and ("File " .. idx .. ": " .. vim.fn.fnamemodify(item.value, ":t")) or ("File " .. idx .. " (empty)")
end

return {
  { "<leader>h",  group = "Harpoon" },

  { "<leader>ha", "<cmd>lua require('harpoon'):list():add()<CR>",                                    desc = "Add File" },
  { "<leader>hm", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", desc = "Menu" },

  { "<leader>h1", "<cmd>lua require('harpoon'):list():select(1)<CR>",                                desc = function() return
    get_harpoon_desc(1) end },
  { "<leader>h2", "<cmd>lua require('harpoon'):list():select(2)<CR>",                                desc = function() return
    get_harpoon_desc(2) end },
  { "<leader>h3", "<cmd>lua require('harpoon'):list():select(3)<CR>",                                desc = function() return
    get_harpoon_desc(3) end },
  { "<leader>h4", "<cmd>lua require('harpoon'):list():select(4)<CR>",                                desc = function() return
    get_harpoon_desc(4) end },
}
