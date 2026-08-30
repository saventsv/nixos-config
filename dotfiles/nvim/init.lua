-- TODO restructure all of the nvim config to be more like a lazy.nvim like config

vim.opt.number = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.g.netrw_banner = 0
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.undofile = true
vim.g.netrw_fastbrowse = 0
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.timeout = true
vim.opt.timeoutlen = 350
vim.opt.splitright = true
vim.opt.linebreak = true


-- hilighting when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 75 })
  end,
})

-- require("config.plugins")
require("config.keymaps")
require("plugins.navigation")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.brackets")
require("plugins.git")
require("plugins.markdown")
require("plugins.ui")
-- require("config.lsp")
-- require("config.cmp")

 
local function deleteplugin()
  vim.ui.input({ prompt = "Plugin: "}, function(package)
    if package then
      vim.pack.del({ package })
    end
  end)
end

vim.keymap.set("n", "<leader>pd", deleteplugin)
