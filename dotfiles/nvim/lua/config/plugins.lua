vim.pack.add({
  -- Misc
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-mini/mini.surround",

  -- visual
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim", -- dependancy for noice

  "https://github.com/wakatime/vim-wakatime",

  -- Markdown
  "https://github.com/bullets-vim/bullets.vim",
  "https://github.com/OXY2DEV/markview.nvim",

  -- Navigaiton
  "https://github.com/nvim-lua/plenary.nvim", -- dependancy for harpoon
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = "harpoon2",
  },

  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/stevearc/oil.nvim",

  -- lsp stuff
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig", -- dependancy for lsp
  "https://github.com/nvim-tree/nvim-web-devicons",

  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/saadparwaiz1/cmp_luasnip",


  -- Git
  "https://github.com/lewis6991/gitsigns.nvim",
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

require("fzf-lua").setup({})
require("oil").setup({
  skip_confirm_for_simple_edits = true,
  delete_to_trash = false,
  view_options = {
    show_hidden = true,
    natural_order = true,
    case_insentsitive = true,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then return end
    ts.setup({
      highlight = { enable = true, },
    })
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({})
  end,
})

require("everforest").setup({
  background = "hard",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    require("markview").setup({
      renderers = {
        markdown = {
          list_items = {
            shift_width = vim.o.shiftwidth, -- or 2/4 depending on your style
            align = true,
          },
        },
      },
    })
  end
})



vim.o.background = "dark"
vim.cmd.colorscheme("everforest")

