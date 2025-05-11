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
	{ "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save" },
	{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
	{ "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle" },
	{ "<leader>c", "<cmd>bp | bd #<CR>", desc = "Close Buffer" },
	{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
	{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
	{
		"<leader>/",
		"<Plug>(comment_toggle_linewise_visual)",
		desc = "Comment toggle",
		mode = { "v" },
	},
}

