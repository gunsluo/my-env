local function config()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "tsserver" },
  }
end

return {
  config = config,
}
