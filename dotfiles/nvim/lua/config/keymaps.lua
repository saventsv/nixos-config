vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- General
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('i', '<C-Backspace>', '<C-w>', { silent = true })
-- set({'n', 'v'}, '<C-y>', '"+y', { desc = 'Copy to system clipboard' })
set({'n'; 'v'}, '<C-y>', '"+y', { desc = 'Copy to system clipboard' })
set('i', '<C-v>', '<C-g>u<C-r><C-o>+')
set('n', '<leader>e', vim.diagnostic.open_float)
set('n', 'gh', ':nohl<CR>')
set({'v', 'n'}, '<leader>rs', ':s//g<Left><Left>')
set('n', '<leader>rw', [[:s/\<<C-r><C-w>\>//g<Left><Left>]])
set('n', '<leader>hs', ':split<CR>')
set('n', '<leader>vs', ':vsplit<CR>')
set('n', '<leader>tw', ':set wrap!<CR>', { buffer = true })


-- file explorers
set('n', '<leader>fe', ':Oil<CR>')

set('n', '<leader>ff', ':FzfLua files<CR>')
set('n', '<leader>fg', ':FzfLua live_grep<CR><C-g>')

-- buffers
set('n', '<Tab>', ':bnext<CR>')
set('n', '<S-Tab>', ':bprev<CR>')

set('n', '<C-h>', '<C-w>h')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')
set('n', '<C-l>', '<C-w>l')

set('n', '<leader>vs', ':vsplit<CR>')
set('n', '<leader>hs', ':split<CR>')

set('n', '<leader>cb', ':close<CR>')

-- quickfix list
set('n', '<leader>ca', ':silent! grepadd ')
set('n', '<leader>co', ':copen<CR>')
-- set('n', '<leader>cc', ':cclose<CR>')
set('n', '<leader>cd', ':cexpr []<CR>')

-- markdown
set('n', '<leader>tt', ':Markview<CR>', { buffer = true })

require("mini.surround").setup({
  mappings = {
    add = "ga",
    delete = "gd",
    replace = "gr",
    find = "gf",
    find_left = "gF",
    -- highlight = "gh",
    update_n_lines = "gn",

    suffix_last = "l",
    suffix_next = "n",
  },
  custom_surroundings = {
    ["("] = { output = { left = "(", right = ")" } },
    [")"] = { output = { left = "( ", right = " )" } },

    ["<"] = { output = { left = "<", right = ">" } },
    [">"] = { output = { left = "< ", right = " >" } },

    ["["] = { output = { left = "[", right = "]" } },
    ["]"] = { output = { left = "[ ", right = " ]" } },

    ["{"] = { output = { left = "{", right = "}" } },
    ["}"] = { output = { left = "{ ", right = " }" } },
  },
})

-- Harpoon
local harpoon = require("harpoon")

harpoon:setup()

set('n', '<leader>ha', function() harpoon:list():add() end)
set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

set('n', '<A-1>', function() harpoon:list():select(1) end)
set('n', '<A-2>', function() harpoon:list():select(2) end)
set('n', '<A-3>', function() harpoon:list():select(3) end)
set('n', '<A-4>', function() harpoon:list():select(4) end)
set('n', '<A-5>', function() harpoon:list():select(5) end)




