local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "bashls",
  "dockerls",
  "gopls",
  "jsonls",
  "ltex",
  "marksman",
  "nil_ls",
  "perlnavigator",
  "pylsp",
  "salt_ls",
  "sqlls",
  "taplo",
  "terraformls",
  "tflint",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
lspconfig.ltex.setup {
  settings = {
    ltex = {
      language = "en-GB",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "pt-BR",
      },
      languageToolHttpServerUri = "https://api.languagetoolplus.com/",
      languageToolOrg = {
        username = "",
        apiKey = ""
      },
      completionEnabled = true,
    }
  }
}
