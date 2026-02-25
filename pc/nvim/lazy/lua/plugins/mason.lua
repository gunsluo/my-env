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
      automatic_enable = true,
    },
  },
}
