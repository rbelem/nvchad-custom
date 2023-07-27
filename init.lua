-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local vim = vim
local opt = vim.opt

--
-- Visual settings
--

-- show 'invisible' characters
opt.listchars = "trail:·,tab:»·,nbsp:_"
opt.list = true
