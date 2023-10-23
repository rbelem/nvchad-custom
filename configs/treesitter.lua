local M = {}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.perl = {
 install_info = {
   url = 'https://github.com/tree-sitter-perl/tree-sitter-perl',
   revision = 'master',
   files = { "src/parser.c", "src/scanner.c" },
   requires_generate_from_grammar = true,
 }
}


M.opts = {
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

return M
