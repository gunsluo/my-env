call plug#begin('~/.config/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-scripts/visual-mark'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

"Plugins for golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plugins for proto
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'

call plug#end()
