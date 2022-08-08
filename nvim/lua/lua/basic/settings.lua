local set_option = vim.api.nvim_set_option

local function set_current_window_option(key, value)
  vim.api.nvim_win_set_option(0, key, value)
end

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

--set_option('tabstop', 2)
--set_option('shiftwidth', 2)
--set_option('softtabstop', 2)
--set_option('expandtab', true)
--set_option('autoindent', true)
--set_option('cindent', true)
--set_option('smarttab', true)
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.smarttab = true

--set_option('incsearch', true)
--set_option('ignorecase', true)
--set_option('smartcase', true)
--set_option('hlsearch', true)
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

--set_option('ruler', true)
--set_option('laststatus', 2)
--set_option('showcmd', true)
--set_option('showmode', true)
--set_option('showmatch', true)
--set_option('lazyredraw', true)
vim.o.ruler = true
vim.o.laststatus = 2
vim.o.showcmd = true
vim.o.showmode = true
vim.o.showmatch = true
vim.o.lazyredraw = true

set_current_window_option('list', true)
--set_option('listchars', 'tab:▸ ,eol:⏎')
vim.o.listchars = 'tab:▸ ,eol:⏎'

set_current_window_option('number', true)
set_current_window_option('relativenumber', true)

--set_option('inccommand', 'split')
--set_option('splitbelow', true)
--set_option('splitright', true)
--set_option('hidden', true)
--set_option('updatetime', 100)
vim.o.inccommand = 'split'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.updatetime = 100
vim.o.signcolumn = 'number'


--set_option('statusline', [[%r %F%m%h%w [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y   %=[L %l,R %c,T %L] %P]])
vim.o.statusline = [[%r %F%m%h%w [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y   %=[L %l,R %c,T %L] %P]]
