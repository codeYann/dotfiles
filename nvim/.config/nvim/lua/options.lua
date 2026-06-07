require "nvchad.options"

local options = {
  number = true,
  relativenumber = true,
  mouse = "a",
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  smartindent = true,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  clipboard = "unnamedplus",
  updatetime = 250,
  timeoutlen = 400,
  cursorline = true,
  signcolumn = "yes",
  swapfile = false,
  backup = false,
  undofile = true,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
