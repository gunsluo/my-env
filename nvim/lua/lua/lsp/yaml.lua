local lsp_settings = require 'lsp.settings'

require('lspconfig').yamlls.setup(lsp_settings.config({
}))
