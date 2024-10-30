local opt = vim.opt

opt.fillchars = { eob = " " }
opt.mouse = "a"
vim.wo.number = true
opt.clipboard = "unnamedplus"

-- no swapfile
vim.opt.swapfile = false

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

-- show search highlight only search mode and  live search
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

-- always split to bottom or right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- auto scroll
vim.opt.scrolloff = 5

-- line wrapping
opt.wrap = false

-- theme and iterm2 settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"
