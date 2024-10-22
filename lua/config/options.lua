local opt = vim.opt

vim.g.mapleader = " "
opt.fillchars = { eob = " " }
opt.mouse = "a"
vim.wo.number = true
opt.clipboard = "unnamedplus"

-- no swapfile
vim.opt.swapfile = false

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smarttab = true
opt.smartindent = true


-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- theme and iterm2 settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- split window
opt.splitright = true
opt.splitbelow = true

-- backspace
opt.backspace = "indent,eol,start"


-- Default keys
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'save buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'close buffer' })
