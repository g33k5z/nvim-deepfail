return {
    key = "l",
    mapping = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    }
}