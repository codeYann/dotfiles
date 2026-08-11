local map = vim.keymap.set
local get_project_root = require "utils.get_project_root"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>pa", function()
  local path = vim.fn.expand "%:p"

  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute file path" })

map("n", "<leader>pr", function()
  local file = vim.fn.expand "%:p"
  local root = get_project_root()
  local relative = vim.fs.relpath(root, file)

  vim.fn.setreg("+", relative)
  vim.notify("Copied project-relative path: " .. relative)
end, { desc = "Copy project-relative file path" })
