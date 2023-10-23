local M = {}


M.opts = {
  window = {
    open = "smart"
  },
  callbacks = {
    post_open = function(bufnr, winnr, ft, is_blocking)
      vim.notify(vim.api.nvim_buf_get_name(bufnr))
      if is_blocking then
        -- Hide the terminal while it's blocking
        require("nvterm.terminal").toggle_all_terms()
      else
        -- If it's a normal file, just switch to its window
        vim.api.nvim_set_current_win(winnr)
      end

      -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
      -- If you just want the toggleable terminal integration, ignore this bit
      if ft == "gitcommit" or ft == "gitrebase" then
        vim.api.nvim_create_autocmd("BufWritePost", {
          buffer = bufnr,
          once = true,
          callback = vim.schedule_wrap(function()
              vim.api.nvim_buf_delete(bufnr, {})
            end)
        })
      end
    end,
  }
}

return M
