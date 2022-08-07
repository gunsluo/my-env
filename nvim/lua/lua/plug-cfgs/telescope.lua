vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>Telescope live_grep_args<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>da', '<Cmd>Telescope diagnostics<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ma', '<Cmd>Telescope vim_bookmarks all<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ma', '<Cmd>Telescope vim_bookmarks current_file<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>fp', '<Cmd>Telescope projects<CR>', { noremap = true })

local function config ()
  require'telescope'.setup {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  require'telescope'.load_extension('fzy_native')
  require("telescope").load_extension("live_grep_args")
  require('telescope').load_extension('vim_bookmarks')
	require('telescope').load_extension('projects')
end

return {
  config = config,
}
