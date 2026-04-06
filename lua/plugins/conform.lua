-- Formatting.
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      -- Leave me alone.
      notify_on_error = false,
      notify_no_formatters = false,
      formatters_by_ft = {
        python = {
          -- To fix auto-fixable lint errors.
          "ruff_fix",
          -- To run the Ruff formatter.
          "ruff_format",
          -- To organize the imports.
          "ruff_organize_imports",
        },
        c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
        cpp = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
        lua = { "stylua" },
        markdown = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        javascript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        json = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        jsonc = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
        less = { "prettier" },
        yaml = { "prettier" },
        sh = { "shfmt" },
        fish = { "fish_indent" },
        toml = { "taplo" },
        kotlin = { "ktlint" },
        -- For filetypes without a formatter:
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = function()
        if vim.bo.filetype == "kotlin" then
          -- kotlin formatting is too slow to do on save.
          return nil
        end

        -- Don't format when minifiles is open, since that triggers the "confirm without
        -- synchronization" message.
        if vim.g.minifiles_active then
          return nil
        end

        -- Skip formatting if triggered from my special save command.
        if vim.g.skip_formatting then
          vim.g.skip_formatting = false
          return nil
        end

        -- Stop if we disabled auto-formatting.
        if not vim.g.autoformat then
          return nil
        end

        return {}
      end,
      formatters = {
        -- Require a Prettier configuration file to format.
        prettier = { require_cwd = true },
      },
    },

    init = function()
      -- Use conform for gQ.
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      -- Start auto-formatting by default (and disable with my ToggleFormat command).
      vim.g.autoformat = true
    end,
  },
}
