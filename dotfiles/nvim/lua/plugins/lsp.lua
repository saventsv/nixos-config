vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- "https://github.com/hrsh7th/nvim-cmp",
  -- "https://github.com/hrsh7th/cmp-nvim-lsp",
  -- "https://github.com/hrsh7th/cmp-buffer",
  -- "https://github.com/hrsh7th/cmp-path",
  -- "https://github.com/L3MON4D3/LuaSnip",
  -- "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/rafamadriz/friendly-snippets",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
    -- name = "blink.cmp"
  },
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
  end)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

require("blink.cmp").setup({
  keymap = {
    preset = "default",

    ["<CR>"] = {
      "accept",
      "fallback",
    }
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = { documentation = { auto_show = false } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" }
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()


vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("bashls", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("nixd", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.config("jdtls", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "gopls",
  "ts_ls",
  "nixd",
  "bashls",
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

