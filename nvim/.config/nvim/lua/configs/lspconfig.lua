require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local markers = require "utils.markers"

local servers = { "html", "cssls", "ts_ls", "gopls", "bashls", "tailwindcss", "astro" }

vim.lsp.config("biome", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, markers.biome)
    if root then
      on_dir(root)
    end
  end,
})

vim.lsp.config("eslint", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, markers.eslint)

    if not root then
      return
    end

    if vim.fs.root(bufnr, markers.biome) then
      return
    end

    on_dir(root)
  end,
})

vim.lsp.enable(servers)
vim.lsp.enable { "eslint", "biome" }
