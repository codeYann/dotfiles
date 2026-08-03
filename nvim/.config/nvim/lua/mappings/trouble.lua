local map = vim.keymap.set

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
