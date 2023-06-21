---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- save
    ["<C-s>"] = "",

    -- Copy all
    ["<C-c>"] = "",

    -- new horizontal term
    ["<leader>h"] = "",

    -- new vertical term
    ["<leader>v"] = "",

    -- toggle nvimtree
    ["<C-n>"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>a"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.session_manager = {
  n = {
    ["<leader>ss"] = { "<cmd> SessionManager save_current_session<CR>", "save current session" },
    ["<leader>sh"] = { "<cmd> SessionManager load_session<CR>", "load session" },
    ["<leader>sl"] = { "<cmd> SessionManager load_last_session<CR>", "load last session" },
    ["<leader>sd"] = { "<cmd> SessionManager delete_session<CR>", "delete session" },
    ["<leader>s."] = { "<cmd> SessionManager load_current_dir_session<CR>", "load current directory session" },
  },
}

return M
