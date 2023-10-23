local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      "Exafunction/codeium.nvim"
    }
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = overrides.mason_lspconfig,
    dependencies = {"williamboman/mason.nvim"},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter").opts
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Session and buffer manager
  -- scope.nvim must be placed before resession.nvim
  {
    "tiagovla/scope.nvim",
    dependencies = {
      "akinsho/bufferline.nvim"
    },
    opts = {
      restore_state = true
    },
  },

  {
    "famiu/bufdelete.nvim",
    event = "BufRead",
  },

  {
    "tiagovla/buffercd.nvim",
    event = "BufRead",
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufRead",
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {
          style_preset = {
            bufferline.style_preset.minimal,
            bufferline.style_preset.no_italic,
          },
          numbers = "ordinal",
          offsets = { { filetype = "NvimTree", text = "File Explorer" } },
        },
        -- highlights = require("darkrose.integrations.bufferline").generate(),
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    opts = {
      options = {
        theme = "onedark",
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          'codeium'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      extensions = {
        "man",
        "nvim-tree",
        "symbols-outline",
        "trouble"
      },
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },

  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-tree.lua"
    },
    event = "VeryLazy",
    opts = require("custom.configs.nvim-possession").opts
  },

  {
    "FabijanZulj/blame.nvim",
    cmd = "ToggleBlame",
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {}
  },

  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  {
    "willothy/flatten.nvim",
    opts = require("custom.configs.flatten").opts,
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "LspAttach",
    opts = {
      mode = "topline",
      separator = "-",
    },
  },

  {
    "nvim-treesitter/playground",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "TSPlaygroundToggle",
  },

  {
    "simrat39/symbols-outline.nvim",
    event = "LspAttach",
    config = function()
      require("symbols-outline").setup()
    end
  },

  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = true,
        sync_clipboard = true,
        sync_registers = true,
      },
      resize = {
        enable_default_keybindings = false,
      },
    }
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup()
    end
  },
}

return plugins
