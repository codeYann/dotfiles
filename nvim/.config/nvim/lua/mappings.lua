require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Tmux Navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })

-- LSP
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })

-- Git
vim.keymap.set("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, {
  desc = "toggle current line blame",
})

vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, {
  desc = "diff against HEAD",
})
