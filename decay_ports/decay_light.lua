local M = {}

M.base_30 = {
   white = "#171b20",
   darker_black = "#d8dbe0",
   black = "#dee1e6", --  nvim bg
   black2 = "#e4e7ec",
   one_bg = "#e8ebf0",
   one_bg2 = "#f1f4f9",
   one_bg3 = "#f9fcff",
   grey = "#a9b1d6",
   grey_fg = "#b3bbe0",
   grey_fg2 = "#bdc5ea",
   light_grey = "#c5cdf2",
   red = "#d6555b",
   baby_pink = "#ea696f",
   pink = "#c68aee",
   line = "#282d35", -- for lines like vertsplit
   green = "#7dc086",
   vibrant_green = "#78dba9",
   blue = "#669be1",
   nord_blue = "#598ed4",
   yellow = "#f1cf8a",
   sun = "#e7c580",
   purple = "#c68aee",
   dark_purple = "#b77bdf",
   teal = "#94f7c5",
   orange = "#e9a180",
   cyan = "#74bee9",
   statusline_bg = "#dcdfe4",
   lightbg = "#e9ecf1",
   pmenu_bg = "#7ddac5",
   folder_bg = "#70a5eb",
}

M.base_16 = {
   base00 = "#dfe2e7",
   base01 = "#e4e7ec",
   base02 = "#f5f5f5",
   base03 = "#a9b1d6",
   base04 = "#171a1f",
   base05 = "#1c252c",
   base06 = "#2b2e33",
   base07 = "#dee1e6",
   base08 = "#d6555b",
   base09 = "#e9a180",
   base0A = "#f1cf8a",
   base0B = "#7dc086",
   base0C = "#9cd1ff",
   base0D = "#669be1",
   base0E = "#bc80e4",
   base0F = "#d6555b",
}

M.type = "light"

M = require("base46").override_theme(M, "decay")

return M
