vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then return end
    ts.setup({
      highlight = { enable = true },
    })
  end
})


