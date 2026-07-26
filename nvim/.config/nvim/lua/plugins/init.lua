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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
    opts = function(_, opts)
      local options = opts or {}
      return options
    end,
    config = function()
      require("ufo").setup {
        provider_selector = function(_, _, _)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function(_, opts)
      local options = opts or {}

      options.bar = {
        enable = function(buf, win, _)
          buf = vim._resolve_bufnr(buf)
          local is_valid_buf = vim.api.nvim_buf_is_valid(buf)
          local is_valid_win = vim.api.nvim_win_is_valid(win)

          if not is_valid_buf or not is_valid_win then
            return false
          end

          if
            not is_valid_buf
            or not is_valid_win
            or vim.fn.win_gettype(win) ~= ""
            or vim.wo[win].winbar ~= ""
            or vim.bo[buf].ft == "help"
          then
            return false
          end

          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if stat and stat.size > 1024 * 1024 then
            return false
          end

          return vim.bo[buf].ft == "markdown"
            or pcall(vim.treesitter.get_parser, buf)
            or not vim.tbl_isempty(vim.lsp.get_clients {
              bufnr = buf,
              method = "textDocument/documentSymbol",
            })
        end,
      }

      return options
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
