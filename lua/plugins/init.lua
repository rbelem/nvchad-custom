local overrides = require("configs.overrides")

return {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require "configs.lspconfig"
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
    opts = require("configs.treesitter").opts
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Theme
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      require("kanagawa").setup {
        theme = "wave",
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true,  -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false,   -- do not set background color
        dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,  -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        background = {         -- map the value of 'background' option to a theme
          dark = "wave",   -- try "dragon" !
          light = "lotus",
        },
      }

      vim.cmd "colorscheme kanagawa"
    end
  },

  -- Session and buffer manager
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = "BufReadPre",
    opts = {
      preset = 'powerline',
      sidebar_filetypes = {
        NvimTree = true,
        Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 4,
            shorting_target = 30,
          }
        },
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
    opts = require("configs.nvim-possession").opts
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
    config = function (_, opts)
      require("codeium").setup(opts)
    end
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
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
    opts = require("configs.flatten").opts,
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },

  {
    "mfussenegger/nvim-jdtls",
    event = "BufRead *.java",
    ft = { "java" },
    opts = require("configs.jdtls").config,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function (_, opts)
      require("jdtls").start_or_attach(opts)
      -- require("jdtls.dap").setup_dap_main_class_configs()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "LspAttach",
    opts = {
      max_lines = 8,
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
    "chentoast/marks.nvim",
    event = "BufEnter",
    opts = {
      default_mappings = false,
      excluded_filetypes = {
        "qf",
        "NvimTree",
        "toggleterm",
        "TelescopePrompt",
        "alpha",
        "netrw",
        "neo-tree",
      },
    },
    config = function (_, opts)
      require("marks").setup(opts)
    end
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
