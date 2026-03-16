-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Wrapping
vim.opt.wrap = false

-- Undo / backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Clipboard (recommended)
vim.opt.clipboard = "unnamedplus"

-- File handling
vim.opt.isfname:append("@-@")

-- Performance
vim.opt.updatetime = 50
