local lsp_settings = require 'lsp.settings'

require('lspconfig').lua_ls.setup(lsp_settings.config({
  -- disable_formatting = true,
}))
