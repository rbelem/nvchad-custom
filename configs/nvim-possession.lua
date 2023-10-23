local M = {}

local ft_blacklist = {
  "gitcommit",
  "nvdash",
  "NvimTree",
  ""
}

local close_blacklisted_buf = function()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
      if vim.tbl_contains(ft_blacklist, vim.bo[bufnr].filetype) then
          vim.cmd("bd " .. bufnr)
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
    require("nvterm.terminal").close_all_terms()
    -- close_blacklisted_buf()
  end,
}

return M
