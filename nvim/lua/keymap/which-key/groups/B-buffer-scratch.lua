local function messages_to_new_buf()
	local messages = vim.api.nvim_exec2("messages", { output = true }).output
	vim.cmd("enew") -- Open a new, unnamed buffer in current window
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(messages, "\n"))
	vim.api.nvim_buf_set_name(buf, ":messages output")
	vim.bo.buftype = "nofile" -- Scratch buffer, not linked to any file
	vim.bo.bufhidden = "wipe" -- Remove from buffer list on :q
	vim.bo.swapfile = false -- No swap file
end

return {
	{
		"<leader>B",
		function()
			messages_to_new_buf()
		end,
		desc = "Messages Scratch (buffer)",
	},
}
