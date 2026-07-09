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
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.current_line_blame = true

      opts.current_line_blame_opts = {
        delay = 100,
        virt_text = true,
        virt_text_pos = "eol",
        ignore_whitespace = true,
      }

      opts.current_line_blame_formatter = "󰜘 <author>, <author_time:%R> • <summary>"

      return opts
    end,
  },
}
