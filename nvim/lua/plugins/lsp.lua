return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
  },
  { "nvimtools/none-ls.nvim" }, -- null-ls
  { "jay-babu/mason-null-ls.nvim", dependencies = { "mason.nvim", "none-ls.nvim" } },
}
