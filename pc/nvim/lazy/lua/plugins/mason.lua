-- * override the configuration of LazyVim plugins
return {
	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	-- add any tools you want to have installed below
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"lua_ls",
				"ts_ls",
				"denols",
				"yamlls",
			},
		},

		-- add pyright to lspconfig
		{
			"neovim/nvim-lspconfig",
			---@class PluginLspOpts
			opts = {
				---@type lspconfig.options
				servers = {
					-- pyright will be automatically installed with mason and loaded with lspconfig
					pyright = {},
				},
			},
		},
	},
}
