local map = vim.keymap.set

map("n", "<leader>;", function()
  require("dropbar.api").pick()
end, { desc = "Pick symbols in winbar" })
