local M = {}


-- local AutoSessionSaveInput = function ()
--   vim.ui.input({ prompt = 'Enter session name: ' }, function(input)
--     -- require("auto-session").AutoSaveSession(input)
--     require("auto-session").SessionSave(input)
--   end)
-- end
--
-- vim.api.nvim_create_user_command(
--   "AutoSessionSaveInput",
--   AutoSessionSaveInput,
--   { complete = require("auto-session").CompleteSessions, bang = true, nargs = "*", desc = "Save Session" }
-- )

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

M.opts = {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "/tmp"},
}

M.sl_opts = {
  previewer = true,
}

return M
