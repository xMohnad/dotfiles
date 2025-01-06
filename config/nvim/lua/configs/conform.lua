local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    bash = { "shfmt" },
    markdown = { "mdformat" },
    css = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    yml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 10000,
    lsp_fallback = true,
    async = false,
  },
}

return options
