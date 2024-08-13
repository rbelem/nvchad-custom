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
  ensure_installed = {
    -- general
    "ltex-ls",
    --
    "prettierd",
    "tree-sitter-cli",

    -- ansible
    "ansible-language-server",

    -- c
    "clang-format",

    -- docker
    "hadolint",

    -- git
    "gitlint",

    -- go
    "golangci-lint-langserver",
    "gopls",
    --
    "golangci-lint",
    "goimports",
    "goimports-reviser",

    -- html
    "html-lsp",

    -- java
    "jdtls",
    --
    "java-debug-adapter",
    "java-test",

    -- javascript
    "deno",
    "eslint_d",

    -- json
    "json-lsp",

    -- lua
    "lua-language-server",
    "stylua",
    "selene",

    -- markdown
    "marksman",

    -- nix
    "nil",

    -- perl
    "perlnavigator",

    -- python
    "python-lsp-server",
    --
    "ruff-lsp",

    -- saltstack
    "salt-lsp",

    -- shellscript
    "bash-language-server",
    --
    "shfmt",
    "shellcheck",

    -- sql
    "sqlls",

    -- terraform
    "terraform-ls",
    "tflint",

    -- toml
    "taplo",

    -- typescript
    "typescript-language-server",

    -- xml
    "lemminx",

    -- yaml
    "yaml-language-server",
    --
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
  "jdtls",
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
