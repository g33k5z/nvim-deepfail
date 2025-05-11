return {
    key = "t",
    mapping = {
        name = "Trouble",
        x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
        X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
        s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
        l = {
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            "LSP Definitions / References / ... (Trouble)",
        },
        L = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
        Q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
    }
}