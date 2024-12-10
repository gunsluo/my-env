-- setup leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = " "

-- cursor movement
vim.api.nvim_set_keymap('n', 'B', '^', { noremap = true })
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = true })
vim.api.nvim_set_keymap('v', 'B', '^', { noremap = true })
vim.api.nvim_set_keymap('v', 'E', '$', { noremap = true })

-- use `kj` to exit insert mode
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- shortcuts for creating a terminal window
vim.api.nvim_set_keymap('n', '<leader>th', ':new term://fish<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':vnew term://fish<CR>', { noremap = true })

-- exit insert mode in terminal mode
-- vim.api.nvim_set_keymap('t', 'kj', '<C-\\><C-n>', { noremap = true })
