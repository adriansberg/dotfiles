-- Rex's "Abyssal Trench" theme, built on tokyonight with Rex's palette
-- (from Rex Beta.app .../SuperDesignTokens.bundle/.../themes.json). Hex values marked * are derived shades.
require("tokyonight.colors").styles.abyssal = function()
  return {
    bg = "#06101a",
    bg_dark = "#040b12", -- *
    bg_dark1 = "#02070c", -- *
    bg_highlight = "#0e1c29",
    blue = "#6dabdd",
    blue0 = "#143349",
    blue1 = "#64d5df",
    blue2 = "#3fbdc9",
    blue5 = "#64d5df",
    blue6 = "#dcebf3",
    blue7 = "#143349",
    comment = "#5c7584", -- *
    cyan = "#64d5df",
    dark3 = "#47606f",
    dark5 = "#6f8796", -- *
    fg = "#b8cdd9",
    fg_dark = "#9db4c2",
    fg_gutter = "#2c4150", -- *
    green = "#52c79a",
    green1 = "#74dcb2",
    green2 = "#3fbdc9",
    magenta = "#ab95dc",
    magenta2 = "#f18787",
    orange = "#d4b25e",
    purple = "#9179c9",
    red = "#f18787",
    red1 = "#e26a6a",
    teal = "#4fe3c1",
    terminal_black = "#47606f",
    yellow = "#e6ca7f",
    git = { add = "#52c79a", change = "#4a90c9", delete = "#e26a6a" },
  }
end

require("tokyonight").load({
  style = "abyssal",
  on_colors = function(c)
    c.bg_visual = "#143349" -- Rex's selection color
  end,
})
vim.g.colors_name = "abyssal-trench"
