-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local nvlsp = require("nvchad.configs.lspconfig")

local function on_attach(client, bufnr)
	nvlsp.on_attach(client, bufnr)

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
	gopls = {
		cmd = { "gopls" },
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
	},
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
	html = {},
	bashls = {},
	yamlls = {
		schemas = {
			["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
		},
		validate = true,
		completion = true,
	},
	-- lua_ls = {},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	dartls = {
		cmd = { "dart", "language-server", "--protocol=lsp" },
		filetypes = { "dart" },
		init_options = {
			closingLabels = true,
			outline = true,
			flutterOutline = true,
		},
	},
	ts_ls = {},
}

-- lsps with default config
for name, lsp in pairs(servers) do
	lsp.on_init = nvlsp.on_init
	lsp.on_attach = on_attach
	lsp.capabilities = nvlsp.capabilities

	lspconfig[name].setup(lsp)
end

-- local servers = {"html", "pyright", "cssls"}
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
