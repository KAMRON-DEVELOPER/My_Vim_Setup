local keymap = vim.keymap

-- Default keys
keymap.set("n", "<leader>w", "<CMD>write<CR>", { desc = "save buffer" })
keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "close buffer" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close current split" })

-- Navigate vim panes better
keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Navigate to up pane" })
keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Navigate to down pane" })
keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Navigate to left pane" })
keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Navigate to right pane" })

-- tab management
keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<CMD>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<CMD>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- increment/decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- code actions and something like stuffs
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hovering" })
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to references" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "show code actions" })
