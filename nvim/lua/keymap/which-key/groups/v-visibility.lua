return {
	{ "<leader>v", group = "Visibility" },
	{
		"<leader>vc",
		"<cmd>Commentless toggle<cr>",
		desc = "Toggle Comments",
	},
	{ "<leader>vm", group = "Markdown" },
	{
		"<leader>vmt",
		"<cmd>RenderMarkdown toggle<cr>",
		desc = "Toggle Markdown UI",
	},
	{ "<leader>vl", group = "LateX" },
	{
		"<leader>vlt",
		"<cmd>RenderLatex toggle<cr>",
		desc = "Toggle Latex UI",
	},
	{
		"<leader>vlc",
		function()
			local ok, render_latex = pcall(require, "render-latex")
			if ok then
				render_latex.clear_all()
				vim.notify("LaTeX Image Canvas Cleared", vim.log.levels.INFO)
			else
				vim.notify("render-latex.nvim not loaded", vim.log.levels.WARN)
			end
		end,
		desc = "Clear LaTeX Images",
	},
	-- TODO: Add other visibility toggles (line numbers, indent guides, wrap, etc.)
}
