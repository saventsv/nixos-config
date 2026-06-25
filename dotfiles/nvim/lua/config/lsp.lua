local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  capabilities = capabilities,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
})
vim.lsp.config("clangd", {
  capabilities = capabilities,
})
vim.lsp.config("bashls", {
  capabilities = capabilities,
})
vim.lsp.config("nixd", {
  capabilities = capabilities,
})
vim.lsp.config("pyright", {
  capabilities = capabilities,
})
vim.lsp.config("jdtls", {
  capabilities = capabilities,
})

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "clangd",
  "bashls",
  "nixd",
  "pyright",
  "jdtls",
})


