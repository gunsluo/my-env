local function config()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "tsserver", "jsonls", "html", "cssls" },
  }
end

return {
  config = config,
}
