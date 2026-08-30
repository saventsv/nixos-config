vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-mini/mini.surround",
})

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({})
  end,
})

require("mini.surround").setup({
  mappings = {
    add = "ga",
    delete = "gd",
    replace = "gr",

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


