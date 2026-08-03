return {
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
