call plug#begin('~/.config/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

"Plugins for golang
Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()
