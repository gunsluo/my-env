local lsp_settings = require 'lsp.settings'

-- vim.lsp.set_log_level("debug")
require('lspconfig').html.setup(lsp_settings.config({
}))

require('lspconfig').cssls.setup(lsp_settings.config({
}))
