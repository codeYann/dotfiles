require "nvchad.options"

local options = {
  number = true,
  relativenumber = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  updatetime = 250,
  timeoutlen = 400,
  cursorline = true,
  signcolumn = "yes",
  swapfile = false,
  backup = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.diagnostic.config {
  float = {
    border = "rounded",
    source = "if_many",
    focusable = false,
  },
  jump = {
    wrap = true,
  },
  severity_sort = true,
  signs = {
    text = { "󰅙", "", "󰋼", "󰌵" },
  },
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = {
    prefix = "",
  },
}
