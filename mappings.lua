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
M.gitsigns = {
  n = {
    ["<leader>hs"] = { "<cmd> Gitsigns stage_hunk<CR>", "Stage hunk" },

    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk<CR>", "Reset hunk" },
    ["<leader>rh"] = { "<cmd> Gitsigns reset_hunk<CR>", "" },

    ["<leader>hS"] = { "<cmd> Gitsigns stage_buffer<CR>", "Stage buffer" },
    ["<leader>hu"] = { "<cmd> Gitsigns undo_stage_hunk<CR>", "Undo stage hunk" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer<CR>", "Reset buffer" },

    ["<leader>hp"] = { "<cmd> Gitsigns preview_hunk<CR>", "Preview hunk" },
    ["<leader>ph"] = { "<cmd> Gitsigns preview_hunk<CR>", "" },

    ["<leader>hb"] = { "<cmd> Gitsigns blame_line {full=true}<CR>", "Blame line" },
    ["<leader>gb"] = { "<cmd> Gitsigns blame_line<CR>", "" },

    ["<leader>tb"] = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Toggle current line blame" },
    ["<leader>hd"] = { "<cmd> Gitsigns diffthis<CR>", "Diff this" },
    ["<leader>hD"] = { "<cmd> Gitsigns diffthis('~')<CR>", "Diff this ('~')" },
    ["<leader>td"] = { "<cmd> Gitsigns toggle_deleted<CR>", "Toggle deleted" },
  },

  v = {
    ["<leader>hs"] = { "<cmd> Gitsigns stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<CR>", "Stage hunk" },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk {vim.fn.line('.'), vim.fn.line('v')}<CR>", "Reset hunk" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>a"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.session_manager = {
  n = {
    ["<leader>sl"] = { "<cmd> ResessionLoad <CR>", "Load Session" },
    ["<leader>sa"] = { "<cmd> ResessionSaveAll <CR>", "Save All Sessions" },
    ["<leader>ss"] = { "<cmd> ResessionSave <CR>", "Save Session" },
    ["<leader>st"] = { "<cmd> ResessionSaveTab <CR>", "Save Tab Session" },
    ["<leader>sd"] = { "<cmd> ResessionDelete<CR>", "Session delete" },
  },
}

return M
