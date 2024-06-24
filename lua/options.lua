require "nvchad.options"

-- add yours here!
vim.opt.laststatus = 0

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!



-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


--
-- General settings
--
vim.opt.swapfile = false
vim.opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

--
-- Visual settings
--

-- show 'invisible' characters
vim.opt.listchars = "trail:·,tab:»·,nbsp:_"
vim.opt.list = true
