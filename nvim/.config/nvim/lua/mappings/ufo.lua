local map = vim.keymap.set

map("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "Open all folds" })

map("n", "zM", function()
  require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
