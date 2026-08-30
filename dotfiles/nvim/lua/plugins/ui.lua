vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim", -- dependancy for noice
})

require("lualine").setup({
  icons_enabled = true,
  theme = "everforest",
})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

require("snacks").setup({
  bigfile = { enabled = false },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  explorer = { enabled = false },
  indent = { enabled = true },
  input = { enabled = false },
  notifier = { enabled = true },
  picker = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = true },
  words = { enabled = false },
})

require("everforest").setup({
  background = "hard",
})

vim.o.background = "dark"
vim.cmd.colorscheme("everforest")

