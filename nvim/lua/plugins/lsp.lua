return {
  {'mason-org/mason.nvim'},
  {'mason-org/mason-lspconfig.nvim', dependencies = {'mason.nvim'}},
  {'nvimtools/none-ls.nvim'},      -- null-ls
  {'jay-babu/mason-null-ls.nvim', dependencies = {'mason.nvim', 'none-ls.nvim'}},
  {'neovim/nvim-lspconfig'},
}
