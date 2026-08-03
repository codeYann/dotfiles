return {
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
}
