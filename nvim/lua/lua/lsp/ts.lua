local lsp_settings = require 'lsp.settings'

require('lspconfig').tsserver.setup(lsp_settings.config({
  -- disable_formatting = true,
}))
