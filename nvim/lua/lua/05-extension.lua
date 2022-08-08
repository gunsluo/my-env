
vim.api.nvim_create_autocmd('BufWritePre', {
  command = 'lua vim.lsp.buf.formatting_sync()',
  nested = true,
})

