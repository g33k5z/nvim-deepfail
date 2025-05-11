return {
    [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>confirm q<CR>", "Quit" },
    ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
    ["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
    ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
}