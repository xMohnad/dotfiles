local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Web development
  b.formatting.prettierd,
  b.code_actions.eslint_d,

  -- Python
  b.diagnostics.ruff,
  -- b.diagnostics.mypy,
  -- b.formatting.black.with({ extra_args = { "--line-length", "79" } }),

  -- Markdown
  -- b.formatting.mdformat,
  -- b.formatting.markdownlint,
  b.diagnostics.alex,
  b.diagnostics.write_good,

  -- b.formatting.prettier,
}

null_ls.setup {
  debug = true,
  sources = sources,
  timeout = 6000,
}
