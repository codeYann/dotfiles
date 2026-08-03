local map = vim.keymap.set

map("n", "<leader>;", require("dropbar.api").pick, { desc = "Pick symbols in winbar" })
