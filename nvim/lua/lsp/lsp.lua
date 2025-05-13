-- -- lsp.lua (Neovim 0.11+)
-- Place in your nvim config folder, e.g. ~/.config/nvim/lua/config/lsp.lua

-- 1. Mason & ensure tools are installed
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "ruff", -- The language-server for Ruff!
    "ts_ls",
    "denols",
    "html",
    "lua_ls",
  }
})

require("mason-null-ls").setup({
  ensure_installed = {
    "black", "ruff", "prettier", "stylua"
  }
})

-- 2. LSPCONFIG setups
local lspconfig = require("lspconfig")

-- Use helper to restrict denols/tsserver to the right projects.
local util = require("lspconfig.util")

-- Python: Pyright (type checker, language features)
lspconfig.pyright.setup({})

-- Python: Ruff (LSP "ruff_lsp") for diagnostics/code actions
lspconfig.ruff.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentSymbolProvider = false
    -- If you have your own on_attach logic, also include that
  end,
})

-- TypeScript (NOT in deno projects)
lspconfig.ts_ls.setup {
  root_dir = function(fname)
    -- Prefer tsserver unless a deno.json in root!
    if util.root_pattern("deno.json", "deno.jsonc")(fname) then
      return nil
    end
    return util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
  end,
}

-- Deno
lspconfig.denols.setup {
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
  -- You may want to add single file support logic if you work with both ecosystems.
}

-- HTML (add "htmldjango" if you want it recognized as HTML)
lspconfig.html.setup({
  filetypes = { "html", "htmldjango" },
})

-- Lua: lua_ls
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Avoid "vim" undefined warning in your Neovim config
      },
    }
  }
}

-- 3. None-LS (null-ls): Formatters/Linters setup
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.ruff,
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- TypeScript/HTML
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "typescript", "typescriptreact", "html" },
      extra_args = { "--print-width", "100" }
    }),
    -- Add more as needed
  },
})

-- 4. Autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.ts", "*.tsx", "*.lua", "*.html" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- 5. Keymaps (buffer-local, on LSP attach, works for all servers)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    -- Example LSP keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP hover" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Show references" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = false }) end,
      { buffer = bufnr, desc = "Format buffer" })
  end,
})

-- (Optional) inlay hints (Neovim 0.10+)
-- require("lsp-inlayhints").setup()

-- For more details, see :help lsp, and each plugin's README.lsp.lua (Neovim 0.11+)
-- Place in your nvim config folder, e.g. ~/.config/nvim/lua/config/lsp.lua
