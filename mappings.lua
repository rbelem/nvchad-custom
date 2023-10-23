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

M.bufferline = {
  n = {
    ["<tab>"] = { "<cmd> BufferLineCycleNext<CR>", "Goto next buffer" },
    ["<S-tab>"] = { "<cmd> BufferLineCyclePrev<CR>", "Goto prev buffer" },
    ["<C-tab>"] = { "<cmd> BufferLineMoveNext<CR>", "Move buffer to next position" },
    ["<C-S-tab>"] = { "<cmd> BufferLineMovePrev<CR>", "Move buffer prev to previous position" },
    ["<leader>x"] = { "<cmd> Bdelete<CR>", "Close buffer" },
  },
}

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
    ["<leader>sl"] = { "<cmd> :lua require(\"nvim-possession\").list()<CR>", "Session list" },
    ["<leader>sn"] = { "<cmd> :lua require(\"nvim-possession\").new()<CR>", "New Session" },
    ["<leader>su"] = { "<cmd> :lua require(\"nvim-possession\").update()<CR>", "Session update" },
    ["<leader>sd"] = { "<cmd> :lua require(\"nvim-possession\").delete()<CR>", "Delete current session" },
  },
}

return M
