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
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })

-- Git
map("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, {
  desc = "toggle current line blame",
})

map("n", "<leader>gd", require("gitsigns").diffthis, {
  desc = "diff against HEAD",
})

-- Nvim Ufo
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- Dropbar
map("n", "<leader>;", require("dropbar.api").pick, { desc = "Pick symbols in winbar" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
  desc = "Diagnostics",
})
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
  desc = "Buffer Diagnostics",
})
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", {
  desc = "Symbols",
})
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {
  desc = "LSP",
})
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", {
  desc = "Location List",
})
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", {
  desc = "Quickfix List",
})
