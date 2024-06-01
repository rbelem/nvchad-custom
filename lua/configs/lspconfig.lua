local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

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

lspconfig.perlnavigator.setup {
  settings = {
    perlnavigator = {
      perlPath = 'perl',
      enableWarnings = true,
      perltidyProfile = '',
      perlcriticProfile = '',
      perlcriticEnabled = true,
    }
  }
}

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
