local M = {}

M.cmp = {
    sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.mason = {
  ensure_installed = {
    -- general
    "prettier",
    "tree-sitter-cli",

    -- docker
    "hadolint",

    -- git
    "gitlint",

    -- go
    "golangci-lint",
    "goimports",
    "goimports-reviser",

    -- lua
    "stylua",

    -- python
    "black",
    "flake8",

    -- shellscript
    "shfmt",
    "shellcheck",

    -- yaml
    "yamlfmt",
    "yamllint",
  },
}

M.mason_lspconfig = {
  "ansiblels",
  "bashls",
  "cssls",
  "denols",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "golangci_lint_ls",
  "gopls",
  "html",
  "jsonls",
  "ltex",
  "lua_ls",
  "marksman",
  "nil_ls",
  "perlnavigator",
  "pyright",
  "salt_ls",
  "sqlls",
  "taplo",
  "terraformls",
  "tflint",
  "tsserver",
  "yamlls",
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
