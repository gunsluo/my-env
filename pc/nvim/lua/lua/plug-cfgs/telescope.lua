local function setup()
  vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>Telescope live_grep_args<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true })

  -- diagnostics
  vim.api.nvim_set_keymap('n', '<leader>da', '<Cmd>Telescope diagnostics bufnr=0<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>dj', '<Cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>dk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>dl', '<Cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<leader>ma', '<Cmd>Telescope vim_bookmarks all<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', 'ma', '<Cmd>Telescope vim_bookmarks current_file<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<leader>fo', '<Cmd>Telescope oldfiles<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fp', '<Cmd>Telescope projects<CR>', { noremap = true })
end

local function config()
  require 'telescope'.setup {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  require 'telescope'.load_extension('fzy_native')
  require("telescope").load_extension("live_grep_args")
  require('telescope').load_extension('vim_bookmarks')
  -- require('telescope').load_extension('projects')
end


return {
  setup = setup,
  config = config,
}
