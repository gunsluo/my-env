local function config()
  require("null-ls").setup({
    sources = {
      require("null-ls").builtins.formatting.goimports,
    },
  })
end

return {
  config = config,
}
