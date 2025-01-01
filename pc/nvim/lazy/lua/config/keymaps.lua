-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- setup leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- setup finder key
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.api.nvim_set_keymap("n", "<leader>ma", "<Cmd>Telescope vim_bookmarks all<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ma", "<Cmd>Telescope vim_bookmarks current_file<CR>", { noremap = true })

-- diagnostics
vim.api.nvim_set_keymap("n", "<leader>da", "<Cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dl", "<Cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", { noremap = true })

-- setup bufferline key
vim.api.nvim_set_keymap("n", "<leader>]", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>[", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>1",
  [[<Cmd>lua require('bufferline').go_to_buffer(1, true)<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>2",
  [[<Cmd>lua require('bufferline').go_to_buffer(2, true)<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>3",
  [[<Cmd>lua require('bufferline').go_to_buffer(3, true)<CR>]],
  { noremap = true, silent = true }
)

-- setup nvim-tree key
vim.api.nvim_set_keymap("n", "<C-m>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-,>", ":NvimTreeFocus<CR>", { noremap = true })
