return {
  {
    "nvim-tree/nvim-web-devicons",
    -- Lots of plugins will require this later.
    lazy = true,
    opts = {
      -- Make the icon for query files more visible.
      override = {
        scm = {
          icon = "󰘧",
          color = "#A9ABAC",
          cterm_color = "16",
          name = "Scheme",
        },
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- JSON/YAML schemas.
  { "b0o/SchemaStore.nvim", lazy = true },
}
