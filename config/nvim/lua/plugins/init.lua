return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      require "configs.null-ls"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      conf.defaults = conf.defaults or {}

      conf.defaults.layout_config = {
        width = 0.9,
        height = 0.5,
        prompt_position = "top",
      }

      conf.defaults.preview_cutoff = 80
      conf.defaults.preview_timeout = 5000
      conf.defaults.layout_strategy = "center"

      return conf
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "bash",
        "html",
        "css",
        "python",
        "fish",
        "markdown",
        "markdown_inline",
        "yaml",
      },
      highlight = { enable = true },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "plasticboy/vim-markdown",
    commit = "df4be8626e2c5b2a42eb60e1f100fce469b81f7d",
    require = { "godlygeek/tabular" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  -- {
  --   "ellisonleao/glow.nvim",
  --   cmd = "Glow",
  -- },
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  -- },
}
