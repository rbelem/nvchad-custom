local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- general
  b.diagnostics.trail_space,
  b.formatting.trim_newlines,
  b.formatting.trim_whitespace,

  -- docker
  b.diagnostics.hadolint,

  -- git
  b.diagnostics.gitlint,
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,

  -- go
  b.diagnostics.golangci_lint.with { extra_args = { "--enable-all" } },
  b.formatting.gofmt,
  b.formatting.goimports,
  b.formatting.goimports_reviser,

  -- html
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- javascript
  b.code_actions.eslint_d,
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!

  -- lua
  b.formatting.stylua,

  -- nix
  b.code_actions.statix,
  b.diagnostics.statix,
  b.formatting.nixfmt,
  b.formatting.nixpkgs_fmt,

  -- perl
  b.formatting.perltidy,

  -- shell
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  b.formatting.shfmt,

  -- terraform
  b.diagnostics.tfsec,
  b.formatting.terraform_fmt,

  -- toml
  b.formatting.taplo,

  -- yaml
  b.diagnostics.yamllint,
  b.formatting.yamlfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
