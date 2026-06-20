-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox_light",
  transparency = true,
  hl_override = {
    LineNr = { fg = "#7c6f64" },
    CursorLineNr = { fg = "#af3a03", bold = true },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NonText = {
      fg = "#af3a03",
      bold = true,
    },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
