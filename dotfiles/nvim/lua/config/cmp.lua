local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
})
