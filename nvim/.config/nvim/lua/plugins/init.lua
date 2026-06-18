return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.scope = {
        enabled = false,
      }
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "go",
        "gomod",
        "gosum",
        "cpp",
        "c",
        "dockerfile",
        "bash",
        "markdown",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
