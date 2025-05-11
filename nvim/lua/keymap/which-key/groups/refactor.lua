return {
    key = "r",
    modes = {"n", "v"},
    mapping = {
        name = "Refactor",
        e = { ":Refactor extract<CR>", "Extract" },
        f = { ":Refactor extract_to_file<CR>", "Extract to file" },
        v = { ":Refactor extract_var<CR>", "Extract var" },
        i = { ":Refactor inline_var<CR>", "Inline var" },
        I = { ":Refactor inline_func<CR>", "Inline func" },
        b = { ":Refactor extract_block<CR>", "Extract block" },
        bf = { ":Refactor extract_block_to_file<CR>", "Extract block to file" },
    }
}