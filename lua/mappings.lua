require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode", nowait = true })

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Window left" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Window right" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Window down" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Window up" })


-- barbar
map("n", "<tab>", "<cmd> BufferNext<CR>", { desc = "Goto next buffer" })
map("n", "<S-tab>", "<cmd> BufferPrevious<CR>", { desc = "Goto prev buffer" })
map("n", "<leader><tab>", "<cmd> BufferMoveNext<CR>", { desc = "Move buffer to next position" })
map("n", "<leader><S-tab>", "<cmd> BufferMovePrev<CR>", { desc = "Move buffer prev to previous position" })
map("n", "<leader>x", "<cmd> BufferClose<CR>", { desc = "Close buffer" })
map("n", "<leader>bl", "<cmd> BufferPick<CR>", { desc = "List buffers"})

-- gitsigns
map("n", "<leader>hs", "<cmd> Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })

map("n", "<leader>hr", "<cmd> Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>rh", "<cmd> Gitsigns reset_hunk<CR>", { desc = "" })

map("n", "<leader>hS", "<cmd> Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>hu", "<cmd> Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
map("n", "<leader>hR", "<cmd> Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })

map("n", "<leader>hp", "<cmd> Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>ph", "<cmd> Gitsigns preview_hunk<CR>", { desc = "" })

map("n", "<leader>hb", "<cmd> Gitsigns blame_line {full=true}<CR>", { desc = "Blame line" })
map("n", "<leader>gb", "<cmd> Gitsigns blame_line<CR>", { desc = "" })

map("n", "<leader>tb", "<cmd> Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
map("n", "<leader>hd", "<cmd> Gitsigns diffthis<CR>", { desc = "Diff this" })
map("n", "<leader>hD", "<cmd> Gitsigns diffthis('~')<CR>", { desc = "Diff this ('~')" })
map("n", "<leader>td", "<cmd> Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

map("v", "<leader>hs", "<cmd> Gitsigns stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<CR>", { desc = "Stage hunk" })
map("v", "<leader>hr", "<cmd> Gitsigns reset_hunk {vim.fn.line('.'), vim.fn.line('v')}<CR>", { desc = "Reset hunk" })

-- marks
map("n", "mm", "<cmd> :lua require(\"marks\").toggle()<CR>", { desc = "Toggle mark" })
map("n", "ml", "<cmd> MarksListAll<CR>", { desc = "List marks" })
map("n", "m,", "<cmd> :lua require(\"marks\").set_next()<CR>", { desc = "Set next marks" })
map("n", "m;", "<cmd> :lua require(\"marks\").set()<CR>", { desc = "Set mark" })
map("n", "mn", "<cmd> :lua require(\"marks\").next()<CR>", { desc = "Next mark" })
map("n", "mp", "<cmd> :lua require(\"marks\").prev()<CR>", { desc = "Previous mark" })
map("n", "m:", "<cmd> :lua require(\"marks\").preview()<CR>", { desc = "Preview marks" })
map("n", "mbn", "<cmd> :lua require(\"marks\").next_bookmark()<CR>", { desc = "Next bookmark" })
map("n", "mbp", "<cmd> :lua require(\"marks\").prev_bookmark()<CR>", { desc = "Previous bookmark" })
map("n", "md", "<cmd> :lua require(\"marks\").delete()<CR>", { desc = "Delete mark" })
map("n", "mdd", "<cmd> :lua require(\"marks\").delete_line()<CR>", { desc = "Delete mark line" })
map("n", "mbd", "<cmd> :lua require(\"marks\").delete_bookmark()<CR>", { desc = "Delete bookmark" })
map("n", "mx", "<cmd> :lua require(\"marks\").delete_buf()<CR>", { desc = "Delete " })

-- nvimtree
map("n", "<leader>a", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })

-- session_manager
map("n", "<leader>sl", "<cmd> :lua require(\"nvim-possession\").list()<CR>", { desc = "Session list" })
map("n", "<leader>sn", "<cmd> :lua require(\"nvim-possession\").new()<CR>", { desc = "New Session" })
map("n", "<leader>su", "<cmd> :lua require(\"nvim-possession\").update()<CR>", { desc = "Session update" })
map("n", "<leader>sd", "<cmd> :lua require(\"nvim-possession\").delete()<CR>", { desc = "Delete current session" })

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "telescope grep for word under cursor" })
