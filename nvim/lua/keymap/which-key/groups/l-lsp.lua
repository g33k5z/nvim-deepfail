return {
  { "<leader>l", group = "LSP" },  -- Group node for WhichKey

  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = { "n", "v" } },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics", mode = { "n", "v" } },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", mode = { "n", "v" } },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", mode = { "n", "v" } },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = { "n", "v" } },
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info", mode = { "n", "v" } },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic", mode = { "n", "v" } },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", mode = { "n", "v" } },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", mode = { "n", "v" } },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", mode = { "n", "v" } },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = { "n", "v" } },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = { "n", "v" } },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", mode = { "n", "v" } },
  { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix", mode = { "n", "v" } },
}
