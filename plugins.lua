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
    opts = require "custom.configs.treesitter"
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
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
    "olimorris/persisted.nvim",
    event = "VeryLazy",
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    opts = {
      use_git_branch = true,
      should_autosave = function()
        if next(vim.fn.argv()) ~= nil then
          return false
        end

        local p = require('persisted')
        local cwd = vim.fn.getcwd():gsub(p.utils.get_dir_pattern(), "%%")
        local session_filename =  p.config.options.save_dir .. cwd  .. p.get_branch() .. ".vim"
        if vim.fn.filereadable(session_filename) then
          vim.api.nvim_echo({ {'Session already exists!\n'}, {'Save the session manually.'} }, true, {})
          return false
        end

        if vim.tbl_contains({ "nvdash", "gitcommit", "" }, vim.bo.filetype) then
          return false
        end
        return true
      end
    },
    config = function(_, options)
      require("persisted").setup(options)
      require("telescope").load_extension("persisted")
    end,
  },

  {
    "FabijanZulj/blame.nvim",
    cmd = "ToggleBlame",
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      vim.schedule(function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
          filetypes = {
            gitcommit = true,
            markdown = true,
            nix = true,
            yaml = true,
          },
        })
      end)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  {
    "willothy/flatten.nvim",
    config = true,
    -- or pass configuration with
    -- opts = {  }
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
