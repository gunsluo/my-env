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
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

  vim.keymap.set('n', 'gb', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', bufopts)
  vim.keymap.set('n', 'gy', '<Cmd>Telescope lsp_type_definitions<CR>', bufopts)
  vim.keymap.set('n', '<leader>ca', '<Cmd>Telescope lsp_code_actions<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', bufopts)
  vim.keymap.set('n', '<leader>sd', '<Cmd>Telescope lsp_document_symbols<CR>', bufopts)

  vim.keymap.set('n', '<leader>F', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  local extension = vim.bo.filetype
  if extension == 'go' then
    -- use goimport instead of gofmt
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end
    })
  else
    vim.api.nvim_create_autocmd('BufWritePre', {
      command = 'lua vim.lsp.buf.format()',
      nested = true,
    })
  end

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true


local formatting_hook = function(client, bufnr, options)
  if options and options.disable_formatting then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end
end

-- local function keymap(mode, keys, fn, desc)
--   vim.keymap.set(mode, keys, fn, { buffer = bufnr, noremap = true, silent = true, desc = desc })
-- end

local function config(options)
  return {
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
      formatting_hook(client, bufnr, options)
      on_attach(client, bufnr)

      -- local active_clients = vim.lsp.get_active_clients()
      -- if client.name == 'denols' then
      --   for _, client_ in pairs(active_clients) do
      --     -- stop tsserver if denols is already active
      --     if client_.name == 'tsserver' then
      --       client_.stop()
      --     end
      --   end
      -- elseif client.name == 'tsserver' then
      --   for _, client_ in pairs(active_clients) do
      --     -- prevent tsserver from starting if denols is already active
      --     if client_.name == 'denols' then
      --       client.stop()
      --     end
      --   end
      -- end
    end,
    flags = lsp_flags,
    capabilities = capabilities,
  }
end

return {
  config = config,
}
