-- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local masonlsp = require("mason-lspconfig")

masonlsp.setup({
  ensure_installed = {
    "ansiblels",
    "bashls",
    "cssls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
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
    "sqlls",
    "taplo",
    "terraformls",
    "tflint",
    "ts_ls",
    "yamlls",
  }
})

local nvlsp = require "nvchad.configs.lspconfig"
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities(nvlsp.capabilities)

masonlsp.setup_handlers({
  -- Default setup for all servers, unless a custom one is defined below
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = capabilities,
    })
  end,
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              vim.fn.expand "$VIMRUNTIME/lua",
              vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
              vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
              vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
              "${3rd}/luv/library",
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,
  ["ltex"] = function ()
    lspconfig.ltex.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = capabilities,
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
  end,
  ["perlnavigator"] = function ()
    lspconfig.perlnavigator.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = capabilities,
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
  end
})
