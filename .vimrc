" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
" let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" tagbar
nmap <F3> :NERDTreeToggle<CR>

" Initialize plugin system
call plug#end()

" ===================
set nocompatible              " be iMproved, required
set nu
" set cursorline		      " 高亮显示当前行
" set cursorcolumn	      " 高亮显示当前列
set showcmd
set mouse=a		      " 鼠标支持
set tabstop=4		      " 按下 Tab 键时，Vim 显示的空格数
set expandtab 		      " tab 转空格
set softtabstop=4  	      " tab 转空格数	
filetype off                  " required
filetype indent on
set autoindent
syntax enable		      " 开启语法高亮功能
colorscheme desert
syntax on                     " 允许用指定语法高亮配色方案替换默认方案
set fileencodings=ucs-bom,utf-8,cp936
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase

" * 指 X11 中的 PRIMARY 选区，即鼠标选中区域。在桌面系统中可按鼠标中键粘贴。
" + 指 X11 中的 CLIPBOARD 选区，即系统剪切板。在桌面系统中可按 Ctrl+V 粘贴。
set clipboard=unnamed
" above "* -> ""

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 15

" python 语法 文档字符折叠支持
autocmd FileType python setlocal foldenable foldmethod=syntax

" yaml indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
