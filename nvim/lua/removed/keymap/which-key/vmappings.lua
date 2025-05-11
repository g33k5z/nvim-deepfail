local vmappings = {
	["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	},
	g = {
		name = "Git",
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
	},
	r = {
		name = "Refactor",
		e = { ":Refactor extract<CR>", "Extract" },
		f = { ":Refactor extract_to_file<CR>", "Extract to file" },
		v = { ":Refactor extract_var<CR>", "Extract var" },
		i = { ":Refactor inline_var<CR>", "Inline var" },
	},
	z = {
		name = "ChatGPT",
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
		t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
		k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
		a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
		r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
	},
}

return vmappings