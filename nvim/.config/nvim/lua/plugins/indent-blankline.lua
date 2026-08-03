return {
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
}
