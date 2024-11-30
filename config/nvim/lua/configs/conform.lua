local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    bash = { "shfmt" }
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 6000,
    lsp_fallback = true,
    async = false,
  },
}

return options
