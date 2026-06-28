local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" }, },
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

vim.lsp.config("elixirls", {
  cmd = { "elixir-ls" },
  capabilities = capabilities,
})

-- vim.lsp.config("qmlls", {
--   cmd = { "qmlls", "-E" },
--   filetypes = { "qml" },
--   capabilities = capabilities,
-- })

vim.lsp.enable({
  "lua_ls",
  "elixirls",
  "gopls",
  "nixd",
  "bashls",
  -- "qmlls",
  "clangd",
  "pyright",
  "jdtls",
})


vim.diagnostic.config({
  underline = false,

  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  -- signs = {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = "",
  --     [vim.diagnostic.severity.WARN] = "▲",
  --     [vim.diagnostic.severity.INFO] = "»",
  --     [vim.diagnostic.severity.HINT] = "⚑",
  --   }
  -- },

  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
  update_in_insert = false,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function ()
    vim.diagnostic.open_float(nil, {
      focus = false
    })
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function ()
    vim.lsp.buf.hover({
      focus = false
    })
  end,
})
