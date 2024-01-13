local lsp_settings = require 'lsp.settings'

local config = lsp_settings.config({
  -- disable_formatting = true,
})
config.root_dir = require('lspconfig').util.root_pattern("deno.json")

require('lspconfig').denols.setup(config)
