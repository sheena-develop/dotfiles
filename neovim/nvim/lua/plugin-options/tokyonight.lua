-- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
return {
  style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
    -- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors/moon.lua
    colors.bg = "#171717"
    colors.bg_dark = "#1e2030"
    colors.bg_dark1 = "#191B29"
    colors.bg_highlight = "#2f334d"
    colors.blue = "#82aaff"
    colors.blue0 = "#3e68d7"
    colors.blue1 = "#65bcff"
    colors.blue2 = "#0db9d7"
    colors.blue5 = "#89ddff"
    colors.blue6 = "#b4f9f8"
    colors.blue7 = "#394b70"
    colors.comment = "#636da6"
    colors.cyan = "#86e1fc"
    colors.dark3 = "#545c7e"
    colors.dark5 = "#737aa2"
    colors.fg = "#c8d3f5"
    colors.fg_dark = "#828bb8"
    colors.fg_gutter = "#3b4261"
    colors.green = "#c3e88d"
    colors.green1 = "#4fd6be"
    colors.green2 = "#41a6b5"
    colors.magenta = "#c099ff"
    colors.magenta2 = "#ff007c"
    colors.orange = "#ff966c"
    colors.purple = "#fca7ea"
    colors.red = "#ff757f"
    colors.red1 = "#c53b53"
    colors.teal = "#4fd6be"
    colors.terminal_black = "#444a73"
    colors.yellow = "#ffc777"
    colors.git = {
      add = "#b8db87",
      change = "#7ca1f2",
      delete = "#e26a75",
    }
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights tokyonight.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    -- h group-name
    highlights.Comment = { fg = colors.comment, bg = "NONE", italic = true }
    -- :h highlight-groups
    highlights.CursorLine = { bg = "#2a2a2a", italic = false }
  end,

  cache = true, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
  },
}
