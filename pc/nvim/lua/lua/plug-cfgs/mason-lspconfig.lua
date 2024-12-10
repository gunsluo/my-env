local function config()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "lua_ls", "ts_ls", "denols", "yamlls" },
  }
end

return {
  config = config,
}
