local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    javascript = { "prettier" },
    python = {
      -- To fix auto-fixable lint errors.
      "ruff_fix",
      -- To run the Ruff formatter.
      "ruff_format",
      -- To organize the imports.
      "ruff_organize_imports",
    },
    bash = { "shfmt" },
    markdown = { "mdformat" },
    yaml = { "prettier" },
    yml = { "prettier" },
    tcss = { "prettier" },
    go = { "gofumpt" },
    dart = { "dart_format" },
    kotlin = { "ktlint" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_format = "fallback",
  },
}

return options
