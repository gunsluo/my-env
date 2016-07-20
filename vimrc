" tab键对应4个空格
set ts=4
" 缩进4个空格
set shiftwidth=4
set expandtab
" 自动对齐功能
set autoindent
set cindent
set smartindent
"set cursorline
":set mouse=nv

"显示行号
set nu
"不兼容vi
"set nocp
"设置字符编码
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
"set encoding=prc
"set cuc
set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start

"功能: 语法高亮
"用法: 
syntax enable
"syntax on
set background=dark
colorscheme solarized
"colorscheme desert
set hlsearch
"set nocompatible               " be iMproved
set noeb

filetype off                    " required!
call plug#begin('~/.vim/plugged')


" let Vundle manage Vundle
"my Bundle here:
Plug 'gmarik/vundle'
Plug 'taglist.vim'
Plug 'winmanager'
"Plug 'cscope-quickfix'
"Plug 'minibufexpl.vim'
Plug 'visual-mark'
Plug 'gunsluo/a.vim'
Plug 'DoxygenToolkit.vim'

Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'nanotech/jellybeans.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'othree/html5.vim'
"Plug 'jQuery'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
"Plug 'godlygeek/csapprox', { 'autoload' :  { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'myusuf3/numbers.vim'
Plug 'gunsluo/vim-javafmt'
Plug 'xuhdev/indent-java.vim'
Plug 'mileszs/ack.vim'
Plug 'matze/vim-move'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'scrooloose/syntastic'

"
" original repos on github
"Plugin 'nsf/gocode', {'rtp': 'vim/'}

" vim-scripts repos

"..................................
" non github repos
"......................................
call plug#end()

filetype plugin indent on

silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction

if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,~/.vim/bundle/neobundle.vim/
endif


if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,~/.vim/bundle/neobundle.vim/
endif


"插件: javafmt
let g:javafmt_options='--aosp'

"插件: Taglist
"功能: 列出Symbol
"用法: Tlist
"设置tlist窗口宽度
"set Tlist_Inc_Winwidth=0
let Tlist_Show_One_File = 1 "不同显示多个文件的taglist，仅显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 "让当前不被编辑的文件列表自动折叠起来
let Tlist_Show_Menu=1 "显示taglist菜单
nmap <F9> :!ctags -R<cr>
"let Tlist_Auto_Open=1 "启动vim自动打开taglist

"插件: WinManager 
"功能: 文件浏览器和窗口管理器
"用法: <F1>: 显示帮助
"      <cr>: 如果光标下是目录，则进入目录; 如果是文件，则打开文件
"       -  : 返回上级目录
"       c  : 切换vim的工作目录为当前正在浏览目录。
"       d  : 创建目录
"       D  : 删除目录或文件
"       i  : 切换显示方式
"       R  : 文件或目录重命名
"       s  : 选择排序方式
"       x  : 定制浏览方式，使用指定的程序打开该文件
let g:winManagerWindowLayout='FileExplorer|TagList'
"=====键盘映射=====
"WinManager
nmap wm :WMToggle<cr>


"插件: MiniBufExplorer
"功能: 列出所有已经打开发的buf
"用法: <Tab>: 向前循环切换到每个buffer名上
"      <S-Tab>: 向后循环切换到每个buffer名上
"      <Enter>: 打开光标所在的buffer
"         d   : 删除光标所在的buffer
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1


"插件: a.vim
"功能: 在源文件和头文件之间切换
"用法:
":A switches to the header file corresponding to the current file being edited
"(or vise versa)
":AS splits and switches
":AV vertical splits and switches
":AT new tab and switches
":AN cycles through matches
":IH switches to file under cursor
":IHS splits and switches
":IHV vertical splits and switches
":IHT new tab and switches
":IHN cycles through matches
"<Leader>ih switches to file under cursor
"<Leader>is switches to the alternate file of file under cursor (e.g. on
"<foo.h> switches to foo.cpp)
"<Leader>ihn cycles through matches 
nmap aa :A<cr>
nmap as :AS<cr>
nmap av :AV<cr>
nmap at :AT<cr>

 
"插件: visualmark
"功能: 高亮书签
"用法: mm 高亮/取消高亮书签
"      <F2> 向前切换书签
"      <S_F2> 向后切换书签


"插件: DoxygenToolkit
"功能: 生成文档
"用法: :DoxAuthor 生成文件头注释
"      :Dox       生成函数头注释
"      :DoxBlock  生成块注释？
"      :O/** */<Left><Left> 注释
"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_authorName="jerrylou, <gunsluo@gmail.com>"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_templateParamTag_pre = "@tparam "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_throwTag_pre = "@throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "@file "
let g:DoxygenToolkit_dateTag = "@date "
let g:DoxygenToolkit_authorTag = "@author "
let g:DoxygenToolkit_versionTag = "@version "
let g:DoxygenToolkit_blockTag = "@name "
let g:DoxygenToolkit_classTag = "@class "
let g:DoxygenToolKit_startCommentBlock = "/// "
let g:DoxygenToolKit_interCommentBlock = "/// "
map dxa :DoxAuthor<cr>
map dxf :Dox<cr>
map dxb :DoxBlock<cr>
map dxc O/** */<Left><Left>


"插件: jellybeans.vim
"功能: Color Scheme
let g:jellybeans_use_lowcolor_black = 0

"插件: ag.vim
"功能: 查询
"用法: :Ag [options] {pattern} [{directory}] 
let g:ackprg = 'ag --nogroup --nocolor --column'


"插件: TagBar
"nnoremap <silent><Leader>st :TagbarToggle<CR>

" If using go please install the gotags program using the following
" go install github.com/jstemmer/gotags
" And make sure gotags is in your path
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
            \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
            \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
nmap <F8> :TagbarToggle<CR>


"插件: Vim-go
" let g:go_snippet_engine = "neosnippet"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
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


"插件: neocomplete
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

"插件: vim-move
let g:move_key_modifier = 'S'

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

set noshowmode
"let g:airline_theme='powerlineish'
"let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
"let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = ':t'

function! GetCwd()
    let currentdir = substitute(getcwd(), expand("$HOME"), "~", "g")
    return currentdir
endfunction
function! GetFileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return "[" . bytes . " B]"
    else
        return "[" . (bytes / 1024) . " kB]"
    endif
endfunction
let g:airline_section_c = '%t %{GetFileSize()} (%{GetCwd()})'

if has('gui_running')
    set guifont=PragmataPro\ for\ Powerline:h15,Source\ Code\ Pro:h13
else
    set guifont=PragmataPro\ for\ Powerline:h15,Source\ Code\ Pro:h15
endif

" ctrlp {{{
augroup ctrlp_config
    let g:ctrlp_clear_cache_on_exit = 0
    " let g:ctrlp_lazy_update = 350
	let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_root_markers = ['.ctrlp']
	let g:ctrlp_map = '<c-f>'
    let g:ctrlp_max_files = 0
	let g:ctrlp_max_height = 25
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } "
    let g:ctrlp_match_window_bottom = 0
    let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
    let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
    let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
	map <c-b> :CtrlPBuffer<cr>

	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\.sass-cache$\|\.git$\|\.hg$\|\.svn$',
				\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

	" On Windows use "dir" as fallback command.
	if WINDOWS()
		let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
	elseif executable('ag')
		let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
	elseif executable('ack')
		let s:ctrlp_fallback = 'ack %s --nocolor -f'
	else
		let s:ctrlp_fallback = 'find %s -type f'
	endif

	let g:ctrlp_user_command = {
				\ 'types': {
				\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
	    		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
				\ },
				\ 'fallback': s:ctrlp_fallback
				\ }
augroup END
"}}}

" NerdTree {{{
    let g:NERDShutUp=1
	map <C-e> <plug>NERDTreeTabsToggle<CR>
	map <leader>nb :NERDTreeFromBookmark
	nmap <leader>nf :NERDTreeFind<CR>
	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeMouseMode=2
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0

    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

" }}}

