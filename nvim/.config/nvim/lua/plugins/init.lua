return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			auto_install = true,
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"css",
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		opts = {
			theme = "dark",
			preview = true,
			auto_update = true,
		},
	},
	{
		"b0o/schemastore.nvim",
		lazy = true,
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
		"cachebag/nvim-tcss",
		config = true,
	},
}
