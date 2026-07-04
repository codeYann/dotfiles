local M = {}

local palette = {
  bg = "#272822",
  fg = "#F8F8F2",
  comment = "#75715E",
  yellow = "#E6DB74",
  green = "#A6E22E",
  orange = "#FD971F",
  purple = "#AE81FF",
  pink = "#F92672",
  blue = "#66D9EF",
  black = "#1E1F1C",
  white = "#FFFFFF",
}

M.base_30 = {
  white = palette.fg,
  darker_black = palette.black,
  black = palette.bg,
  black2 = "#2D2E28",
  one_bg = "#32332D",
  one_bg2 = "#383933",
  one_bg3 = "#40413A",
  grey = palette.comment,
  grey_fg = "#8A8675",
  grey_fg2 = "#9C9886",
  light_grey = "#B5B29F",
  red = palette.pink,
  baby_pink = "#FF5C8A",
  pink = palette.purple,
  line = "#3E3D32",
  green = palette.green,
  vibrant_green = "#B6F14A",
  blue = palette.blue,
  nord_blue = palette.blue,
  cyan = palette.blue,
  teal = palette.blue,
  yellow = palette.yellow,
  orange = palette.orange,
  sun = palette.orange,
  purple = palette.purple,
  dark_purple = "#8C6AEF",
  statusline_bg = "#2B2C27",
  lightbg = "#363731",
  pmenu_bg = palette.purple,
  folder_bg = palette.blue,
}

M.base_16 = {
  base00 = palette.bg,
  base01 = "#2D2E28",
  base02 = "#32332D",
  base03 = palette.comment,
  base04 = "#9C9886",
  base05 = palette.fg,
  base06 = "#FCFCFA",
  base07 = palette.white,
  base08 = palette.pink, -- variáveis especiais / erros
  base09 = palette.purple, -- números
  base0A = palette.yellow, -- constantes
  base0B = palette.yellow, -- strings
  base0C = palette.blue, -- regex, escape
  base0D = palette.green, -- funções
  base0E = palette.blue, -- keywords
  base0F = palette.orange,
}

M.type = "dark"

return M
