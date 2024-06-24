---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "one_light" },

  hl_override = {
    CursorLine = {
      bg = "black2",
    },
    Comment = {
      italic = true,
    },
  },

  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },

  nvdash = {
    load_on_startup = false,
    buttons = {
      { "  Session List", "Spc s l", ":lua require(\"nvim-possession\").list()" },
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
    overriden_modules = false,
  },

  tabufline = {
    enabled = false,
  },
}

return M
