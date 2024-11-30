return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
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
    ft = { "python" },
    opts = function()
      require("configs.null-ls")
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
        "vim", "lua", "vimdoc", "bash",
        "html", "css", "python", "fish",
      },
      -- highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = false,
      -- },
    },
  },

  -- {
  --  "williamboman/mason.nvim",
  --  opts = {
  --    ensure_installed = {
  --      "pyright",
  --      "mypy",
  --      "ruff",
  --    },
  --  },
  --},

}
