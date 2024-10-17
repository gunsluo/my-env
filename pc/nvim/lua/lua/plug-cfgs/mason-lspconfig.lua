local function config()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "lua_ls", "ts_ls", "svelte", "jsonls", "html", "cssls", "yamlls" },
  }
end

return {
  config = config,
}
