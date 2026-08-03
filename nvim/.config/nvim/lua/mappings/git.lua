local map = vim.keymap.set

map("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, {
  desc = "toggle current line blame",
})

map("n", "<leader>gd", require("gitsigns").diffthis, {
  desc = "diff against HEAD",
})
