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

-- diagnostics
vim.api.nvim_set_keymap('n', '<leader>dj', '<Cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', '<Cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', { noremap = true })
-- only available in nvim 0.7
-- vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next);
-- vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev);
-- vim.keymap.set('n', '<leader>dl', vim.diagnostic.show_line_diagnostics);


-- exit insert mode in terminal mode
-- vim.api.nvim_set_keymap('t', 'kj', '<C-\\><C-n>', { noremap = true })
