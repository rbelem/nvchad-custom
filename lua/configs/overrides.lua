local M = {}

M.cmp = {
    sources = {
    { name = "codeium", group_index = 1, priority = 100, },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.mason = {
  registries = {
    "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry",
  },
}

-- git support in nvimtree
M.nvimtree = {
  update_cwd = true, --tiagovla/buffercd.nvim
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
