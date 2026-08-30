vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- dependancy for harpoon
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = "harpoon2",
  },

  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/stevearc/oil.nvim",

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

-- Keymaps
vim.keymap.set('n', '<leader>fe', ':Oil<CR>')

vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>rg', ':FzfLua live_grep<CR><C-g>')

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<A-1>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<A-2>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<A-3>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<A-4>', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<A-5>', function() harpoon:list():select(5) end)

