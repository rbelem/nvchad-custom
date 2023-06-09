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

M.treesitter = {
  ensure_installed = {
    "bash",
    "css",
    "diff",
    "dockerfile",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "nix",
    "perl",
    "python",
    "regex",
    "sql",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}

M.mason = {
  ensure_installed = {
    -- general
    "ltex-ls",

    -- ansible
    "ansible-language-server",

    -- css
    "css-lsp",

    -- docker
    "dockerfile-language-server",
    "hadolint",

    -- git
    "gitlint",

    -- go
    "golangci-lint",
    "golangci-lint-langserver",
    "goimports",
    "goimports-reviser",
    "gopls",

    -- html
    "html-lsp",

    -- javascript
    "deno",
    "eslint_d",

    -- json
    "json-lsp",

    -- lua
    "lua-language-server",
    "stylua",

    -- markdown
    "marksman",

    -- nix
    "nil",

    -- perl
    "perlnavigator",

    -- python
    "python-lsp-server",

    -- saltstack
    "salt-lsp",

    -- shellscript
    "bash-language-server",
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

    -- yaml
    "yamlfmt",
    "yaml-language-server",
    "yamllint",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
