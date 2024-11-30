-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"



local function on_attach(client, bufnr)
  configs.on_attach(client, bufnr)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "", {
    noremap = true,
    silent = true,
    callback = function()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      local line = cursor_pos[1] - 1
      local col = cursor_pos[2]

      local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
      local has_diagnostics = false

      for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.col <= col and col <= diagnostic.end_col then
          has_diagnostics = true
          break
        end
      end
      if has_diagnostics then
        vim.diagnostic.open_float(nil, {
          focusable = true,
          severity_sort = true,
          source = "if_many",
        })
      else
        vim.lsp.buf.hover()
      end
    end,
  })
end

local servers = {
  html = {},
  bashls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}


for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
