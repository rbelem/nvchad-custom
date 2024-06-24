local M = {}

local ft_blacklist = {
  'gitcommit',
  'nvdash',
  'NvimTree'
}

local close_blacklisted_buf = function()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
      local bufft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
      if vim.api.nvim_buf_is_valid(bufnr)
        and vim.api.nvim_buf_get_option(bufnr, 'buflisted')
        and vim.tbl_contains(ft_blacklist, bufft) then
          vim.cmd("BufferClose " .. bufnr)
      end
  end
end

local close_nvimtree = function()
  local ok, api = pcall(require, "nvim-tree.api")
  if ok then api.tree.close_in_all_tabs() end
end

M.opts = {
  autosave = true,
  autoswitch = {
    enable = true,
  },
  save_hook = function()
    close_nvimtree()
    require("nvchad.term").close_all_terms()
    close_blacklisted_buf()
    -- persisting barbar.nvim state
    vim.api.nvim_exec_autocmds('User', {pattern = 'SessionSavePre'})
  end
}

return M
