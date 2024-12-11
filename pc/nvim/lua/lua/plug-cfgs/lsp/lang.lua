local on_attach = function(client, bufnr)
  -- auto format
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
end

local function settings()
  return {
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
end


local function setup()
  -- These are just examples. Replace them with the language
  -- servers you have installed in your system
  require('lspconfig').gopls.setup(vim.tbl_deep_extend('force', settings(), {}))
  require('lspconfig').lua_ls.setup(vim.tbl_deep_extend('force', settings(), {}))
  require('lspconfig').yamlls.setup(vim.tbl_deep_extend('force', settings(), {}))

  -- Javascript and Typescript
  local files_in_pwd = vim.fn.readdir(vim.fn.getcwd())
  local should_init_deno_lsp = false
  for _, file_name in ipairs(files_in_pwd) do
    if file_name == 'deno.json' then
      should_init_deno_lsp = true
    end
  end

  if should_init_deno_lsp then
    require('lspconfig').denols.setup(vim.tbl_deep_extend('force', settings(), {
      settings = {
        deno = {
          enable = true,
          unstable = true,
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = {
              enabled = 'all',
              suppressWhenArgumentMatchesName = true,
            },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = {
              enabled = true,
              suppressWhenArgumentMatchesName = true,
            },
          },
        },
      },
    }))
  else
    require('lspconfig').ts_ls.setup(vim.tbl_deep_extend('force', settings(), {
      init_options = {
        preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }))
  end
end

return {
  setup = setup,
}
