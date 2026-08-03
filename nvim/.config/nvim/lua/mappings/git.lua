local map = vim.keymap.set

map("n", "<leader>gb", function()
  require("gitsigns").toggle_current_line_blame()
end, {
  desc = "toggle current line blame",
})

map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, {
  desc = "diff against HEAD",
})
