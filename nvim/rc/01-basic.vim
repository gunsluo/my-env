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
set statusline=%r\ %F%m%h%w\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y\ \ \ %=[L\ %l,R\ %c,T\ %L]\ %P
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)



"功能: 语法高亮
"用法: 
syntax enable
set background=dark
colorscheme NeoSolarized
