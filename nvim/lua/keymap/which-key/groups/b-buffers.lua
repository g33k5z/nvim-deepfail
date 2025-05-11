return {
  { "<leader>b",  group = "Buffers" }, -- group node
  { "<leader>bj", "<cmd>BufferLinePick<cr>",         desc = "Jump" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>",      desc = "Find" },
  { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>",    desc = "Previous" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>",    desc = "Next" },
  { "<leader>bW", "<cmd>noautocmd w<cr>",            desc = "Save without formatting" },
  { "<leader>be", "<cmd>BufferLinePickClose<cr>",    desc = "Pick which buffer to close" },
  { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",    desc = "Close all to the left" },
  { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",   desc = "Close all to the right" },
  { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
  { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
}
