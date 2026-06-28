return {
  "nvim-mini/mini.surround",
  config = function ()
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

  end
}
