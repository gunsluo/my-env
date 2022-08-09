-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  vim.keymap.set('n', 'gb', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', bufopts)
  vim.keymap.set('n', 'gy', '<Cmd>Telescope lsp_type_definitions<CR>', bufopts)
  vim.keymap.set('n', '<leader>ca', '<Cmd>Telescope lsp_code_actions<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', bufopts)
  vim.keymap.set('n', '<leader>sd', '<Cmd>Telescope lsp_document_symbols<CR>', bufopts)

	-- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    vim.keymap.set("n", "<leader>F", "<Cmd>lua vim.lsp.buf.formatting()<CR>", bufopts)
  elseif client.resolved_capabilities.document_range_formatting then
    vim.keymap.set("n", "<leader>F", "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", bufopts)
  end

	require('lsp_signature').on_attach({
		bind = true,
		handler_opts = {
			border = "rounded"
		},
	}, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


local formatting_hook = function(client, bufnr, options)
  if options and options.disable_formatting then
    -- client.server_capabilities.document_formatting = false -- 0.7 and earlier 
    -- client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    -- client.server_capabilities.documentRangeFormattingProvider = false
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local function config (options)
  return {
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
      formatting_hook(client, bufnr, options)
      on_attach(client, bufnr)
    end,
    flags = lsp_flags,
    capabilities = capabilities,
  }
end

return {
  config = config,
}

