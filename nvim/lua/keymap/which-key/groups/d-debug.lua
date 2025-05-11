return {
  { "<leader>d", group = "Debug" }, -- Group node

  { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
  { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
  { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
  { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
  { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
  { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
  { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },        -- Consider renaming desc to "Continue" for clarity if desired
  { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
  { "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
}
