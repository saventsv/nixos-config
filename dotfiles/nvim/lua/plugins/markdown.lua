vim.pack.add({
  "https://github.com/bullets-vim/bullets.vim",
  "https://github.com/OXY2DEV/markview.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
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


