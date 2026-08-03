return {
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

          if vim.fn.win_gettype(win) ~= "" or vim.wo[win].winbar ~= "" or vim.bo[buf].ft == "help" then
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
}
