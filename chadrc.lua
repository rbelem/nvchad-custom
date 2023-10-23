---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Load Session", "Spc s l", "ResessionLoad" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc b m", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  -- Add column number
  statusline = {
    -- Added an option in my nvchad fork to disable the statusline
    enabled = false,
  },

  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
