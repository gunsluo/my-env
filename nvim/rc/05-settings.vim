
filetype plugin indent on

"插件: Vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_autosave = 0
let g:go_play_open_browser = 0
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" tab or buf 1
nnoremap <leader>1 :call functions#tab_buf_switch(1)<cr>
" tab or buf 2
nnoremap <leader>2 :call functions#tab_buf_switch(2)<cr>
" tab or buf 3
nnoremap  <leader>3 :call functions#tab_buf_switch(3)<cr>
" tab or buf 4
nnoremap  <leader>4 :call functions#tab_buf_switch(4)<cr>
" tab or buf 5
nnoremap  <leader>5 :call functions#tab_buf_switch(5)<cr>
" tab or buf 6
nnoremap  <leader>6 :call functions#tab_buf_switch(6)<cr>
" tab or buf 7
nnoremap  <leader>7 :call functions#tab_buf_switch(7)<cr>
" tab or buf 8
nnoremap  <leader>8 :call functions#tab_buf_switch(8)<cr>
" tab or buf 9
nnoremap  <leader>9 :call functions#tab_buf_switch(9)<cr>

" tab navigation like zsh
:nmap <leader>h :bp<CR>
:imap <leader>h <C-c>:bp<CR>
:nmap <leader>l :bn<CR>
:imap <leader>l <C-c>:bn<CR>
:nmap <leader>w :bd<CR>:bn<CR>:bp<CR>
:imap <leader>w <C-c>:bd<CR>:bn<CR>:bp<CR>


" NERDTree
let NERDTreeQuitOnOpen = 0
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tagbar 
nmap <F8> :TagbarToggle<CR>

