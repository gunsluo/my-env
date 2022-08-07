vim.api.nvim_set_keymap('n', '<C-m>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-/>', ':NvimTreeFocus<CR>', { noremap = true })

local function setup ()
end

local function config()
	require("nvim-tree").setup()
	require('nvim-tree').toggle(true, true)
end

return {
  setup = setup,
  config = config,
}
