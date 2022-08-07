filetype plugin indent on

"插件: Vim-go
let g:go_fmt_command = "gopls"
let g:go_highlight_fields = 1 
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_autosave = 1
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
"let g:go_snippet_engine = "neosnippet"
"let g:go_snippet_engine = "automatic"
let g:syntastic_go_checkers = ['golint', 'govet']

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


" tagbar 
nmap <F8> :TagbarToggle<CR>


" NERDTree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" tab navigation like zsh
:nmap <leader>h :bp<CR>
:imap <leader>h <C-c>:bp<CR>
:nmap <leader>l :bn<CR>
:imap <leader>l <C-c>:bn<CR>
:nmap <leader>w :call functions#tab_buf_close()<CR>
:imap <leader>w <C-c>:call functions#tab_buf_close()<CR>


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" gitgutter
let g:gitgutter_enabled = 0
:nmap <leader>gt :GitGutterToggle<CR>
:imap <leader>gt <C-c>:GitGutterToggle<CR>

" vim-buf
let g:ale_linters = {
\   'proto': ['buf-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

