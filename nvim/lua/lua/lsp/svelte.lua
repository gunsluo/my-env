local lsp_settings = require 'lsp.settings'

require('lspconfig').svelte.setup(lsp_settings.config({
  -- disable_formatting = true,
}))
