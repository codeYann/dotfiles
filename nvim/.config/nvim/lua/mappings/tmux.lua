local map = vim.keymap.set

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })
