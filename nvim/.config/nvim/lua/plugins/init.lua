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
      local options = opts or {}
      options.scope = {
        enabled = false,
      }
      return options
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
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local options = opts or {}

      options.current_line_blame = true

      options.current_line_blame_opts = {
        delay = 100,
        virt_text = true,
        virt_text_pos = "eol",
        ignore_whitespace = true,
      }

      options.current_line_blame_formatter = "󰜘 <author>, <author_time:%R> • <summary>"

      return options
    end,
  },
}
