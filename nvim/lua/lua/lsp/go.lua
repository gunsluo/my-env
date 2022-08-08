local lsp_settings = require 'lsp.settings'

require('lspconfig').gopls.setup(lsp_settings.config({
  disable_formatting = true,
}))
