local function config()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "lua_ls", "tsserver", "jsonls", "html", "cssls" },
  }
end

return {
  config = config,
}
