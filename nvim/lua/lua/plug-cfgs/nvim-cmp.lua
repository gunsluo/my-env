local function config ()
	vim.api.nvim_set_option('completeopt', 'menu,menuone,noselect')
	local cmp = require('cmp')
	local lspkind = require('lspkind')

	cmp.setup({
		snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
		window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

		sources = cmp.config.sources({
      -- { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
    }),

		formatting = {
      format = lspkind.cmp_format(),
    },

	})
end

return {
  config = config,
}
