return {
    key = "h",
    mapping = {
        name = "Harpoon",
        a = { "<cmd>lua require('harpoon'):list():append()<CR>", "Add File" },
        m = { "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", "Menu" },
        ["1"] = { "<cmd>lua require('harpoon'):list():select(1)<CR>", "File 1" },
        ["2"] = { "<cmd>lua require('harpoon'):list():select(2)<CR>", "File 2" },
        ["3"] = { "<cmd>lua require('harpoon'):list():select(3)<CR>", "File 3" },
        ["4"] = { "<cmd>lua require('harpoon'):list():select(4)<CR>", "File 4" },
    }
}