local lspconfig = require "lspconfig"

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
