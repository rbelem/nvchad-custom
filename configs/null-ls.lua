local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- general
  b.diagnostics.trail_space,

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
  b.formatting.prettierd,

  -- lua
  b.formatting.stylua,

  -- nix
  b.code_actions.statix,
  b.diagnostics.statix,
  b.formatting.nixfmt,
  b.formatting.nixpkgs_fmt,

  -- shell
  b.formatting.shfmt,

  -- terraform
  b.diagnostics.tfsec,
  b.formatting.terraform_fmt,

  -- yaml
  b.diagnostics.yamllint,
  b.formatting.yamlfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
