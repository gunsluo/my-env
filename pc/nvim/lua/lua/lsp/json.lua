local lsp_settings = require 'lsp.settings'

require('lspconfig').jsonls.setup(lsp_settings.config({
}))
