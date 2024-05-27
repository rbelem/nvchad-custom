---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- save
    ["<C-s>"] = "",

    -- Copy all
    ["<C-c>"] = "",

    -- new buffer
    ["<leader>b"] = "",

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

  t = {
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Window left" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Window right" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Window down" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Window up" },
  },
}

-- more keybinds!

M.barbar = {
  n = {
    ["<tab>"] = { "<cmd> BufferNext<CR>", "Goto next buffer" },
    ["<S-tab>"] = { "<cmd> BufferPrevious<CR>", "Goto prev buffer" },
    ["<leader><tab>"] = { "<cmd> BufferMoveNext<CR>", "Move buffer to next position" },
    ["<leader><S-tab>"] = { "<cmd> BufferMovePrev<CR>", "Move buffer prev to previous position" },
    ["<leader>x"] = { "<cmd> BufferClose<CR>", "Close buffer" },
    ["<leader>bl"] = { "<cmd> BufferPick<CR>", "List buffers"}
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

M.marks = {
  n = {
    ["<leader>mm"] = { "<cmd> :lua require(\"marks\").toggle()<cr>", "Toggle mark" },
    ["<leader>ml"] = { "<cmd> MarksListAll<cr>", "List marks" },
    ["<leader>m,"] = { "<cmd> :lua require(\"marks\").set_next()<cr>", "Set next marks" },
    ["<leader>m;"] = { "<cmd> :lua require(\"marks\").set()<cr>", "Set mark" },
    ["<leader>mn"] = { "<cmd> :lua require(\"marks\").next()<cr>", "Next mark" },
    ["<leader>mp"] = { "<cmd> :lua require(\"marks\").prev()<cr>", "Previous mark" },
    ["<leader>m:"] = { "<cmd> :lua require(\"marks\").preview()<cr>", "Preview marks" },
    ["<leader>mbn"] = { "<cmd> :lua require(\"marks\").next_bookmark()<cr>", "Next bookmark" },
    ["<leader>mbp"] = { "<cmd> :lua require(\"marks\").prev_bookmark()<cr>", "Previous bookmark" },
    ["<leader>md"] = { "<cmd> :lua require(\"marks\").delete()<cr>", "Delete mark" },
    ["<leader>mdd"] = { "<cmd> :lua require(\"marks\").delete_line()<cr>", "Delete mark line" },
    ["<leader>mbd"] = { "<cmd> :lua require(\"marks\").delete_bookmark()<cr>", "Delete bookmark" },
    ["<leader>mx"] = { "<cmd> :lua require(\"marks\").delete_buf()<cr>", "Delete " }
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
