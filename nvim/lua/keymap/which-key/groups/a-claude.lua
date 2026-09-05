-- Buffer-local <leader>as in file explorers: adds the file under the cursor.
-- which-key has no `ft` field (that is a lazy.nvim keys-spec thing), so scope it
-- with an autocmd and which-key's `buffer` field instead.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ClaudeCodeTreeAdd", { clear = true }),
	pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
	callback = function(ev)
		require("which-key").add({
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file to Claude",
				buffer = ev.buf,
			},
		})
	end,
})

return {
	{ "<leader>a", group = "Claude Code" }, -- Group node

	{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
	{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
	{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume session" },
	{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last session" },
	{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
	{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
	{ "<leader>a?", "<cmd>ClaudeCodeStatus<cr>", desc = "Status" },

	-- Diff review
	{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
	{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	{ "<leader>aq", "<cmd>ClaudeCodeCloseAllDiffs<cr>", desc = "Close pending diffs" },

	-- Send the visual selection as a message
	{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection", mode = { "v" } },
}
