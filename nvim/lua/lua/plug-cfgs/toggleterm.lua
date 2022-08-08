local function config()
  vim.api.nvim_set_keymap('n', '<leader>o', '<Cmd>ToggleTerm size=30 direction=horizontal<CR>', { noremap = true })

  require("toggleterm").setup()
end

return {
  config = config,
}
