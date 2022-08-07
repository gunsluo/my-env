local set_option = vim.api.nvim_set_option

local function set_current_window_option(key, value)
  vim.api.nvim_win_set_option(0, key, value)
end

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

--set_option('tabstop', 2)
vim.o.tabstop = 2
set_option('softtabstop', 2)
set_option('shiftwidth', 2)
set_option('expandtab', true)
set_option('autoindent', true)
set_option('smarttab', true)

set_option('incsearch', true)
set_option('ignorecase', true)
set_option('smartcase', true)
set_option('hlsearch', true)

set_option('ruler', true)
set_option('laststatus', 2)
set_option('showcmd', true)
set_option('showmode', true)
set_option('showmatch', true)

set_option('lazyredraw', true)

set_current_window_option('list', true)
set_option('listchars', 'tab:▸ ,eol:⏎')

set_current_window_option('number', true)
set_current_window_option('relativenumber', true)

set_option('inccommand', 'split')
set_option('splitbelow', true)
set_option('splitright', true)

vim.o.signcolumn = 'number'

set_option('hidden', true)

set_option('updatetime', 100)

set_option('statusline', [[%r %F%m%h%w [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y   %=[L %l,R %c,T %L] %P]])

