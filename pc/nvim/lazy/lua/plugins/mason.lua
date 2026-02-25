-- * override the configuration of LazyVim plugins
return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"lua_ls",
				"ts_ls",
				"denols",
				"yamlls",
			},
		},
		-- This is the key part that was missing:
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
			-- Optional: Automatically set up servers with default config
			-- This line is commonly added to integrate with nvim-lspconfig
			-- require("lspconfig").setup_handlers {} -- If you have lspconfig handlers
		end,
	},
}
