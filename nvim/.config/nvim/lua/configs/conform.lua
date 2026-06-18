local conform_util = require "conform.util"
local markers = require "utils.markers"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
    astro = { "biome", "prettierd", "prettier", stop_after_first = true },
    go = { "gofumpt", "goimports-reviser" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
  },

  notify_on_error = true,
  notify_no_formatters = true,

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    biome = {
      cwd = conform_util.root_file(markers.biome),
      require_cwd = true,
    },
    prettierd = {
      cwd = conform_util.root_file(markers.prettier),
      require_cwd = true,
    },
    prettier = {
      cwd = conform_util.root_file(markers.prettier),
      require_cwd = true,
    },
  },
}

return options
