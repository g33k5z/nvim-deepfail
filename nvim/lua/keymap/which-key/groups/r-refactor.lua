return {
  { "<leader>r", group = "Refactor" },

  { "<leader>re", ":Refactor extract<CR>", desc = "Extract", mode = { "n", "v" } },
  { "<leader>rf", ":Refactor extract_to_file<CR>", desc = "Extract to file", mode = { "n", "v" } },
  { "<leader>rv", ":Refactor extract_var<CR>", desc = "Extract var", mode = { "n", "v" } },
  { "<leader>ri", ":Refactor inline_var<CR>", desc = "Inline var", mode = { "n", "v" } },
  { "<leader>rI", ":Refactor inline_func<CR>", desc = "Inline func", mode = { "n", "v" } },
  { "<leader>rb", ":Refactor extract_block<CR>", desc = "Extract block", mode = { "n", "v" } },
  { "<leader>rbf", ":Refactor extract_block_to_file<CR>", desc = "Extract block to file", mode = { "n", "v" } },
}
